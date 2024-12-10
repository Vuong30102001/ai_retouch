import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:typed_data';

import 'original_photo_screen.dart';

class AlbumMediaScreen extends StatefulWidget {
  @override
  _AlbumMediaScreenState createState() => _AlbumMediaScreenState();
}

class _AlbumMediaScreenState extends State<AlbumMediaScreen> {
  List<AssetPathEntity> albums = [];
  List<AssetEntity> mediaList = [];
  AssetPathEntity? selectedAlbum;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  int currentPage = 0;
  final int pageSize = 20;

  @override
  void initState() {
    super.initState();
    _fetchAlbums();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !isLoading) {
        _fetchMedia(loadMore: true);
      }
    });
  }

  Future<void> _fetchAlbums() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      PhotoManager.openSetting();
      return;
    }

    final albumList = await PhotoManager.getAssetPathList(
      type: RequestType.common,
    );

    setState(() {
      albums = albumList;
      if (albums.isNotEmpty) {
        selectedAlbum = albums[0];
        _fetchMedia();
      }
    });
  }

  Future<void> _fetchMedia({bool loadMore = false}) async {
    if (isLoading || selectedAlbum == null) return;

    setState(() => isLoading = true);
    final newMedia = await selectedAlbum!.getAssetListPaged(
      page: currentPage,
      size: pageSize,
    );

    setState(() {
      if (loadMore) {
        mediaList.addAll(newMedia);
      } else {
        mediaList = newMedia;
      }
      currentPage++;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Albums & Media")),
      body: Column(
        children: [
          // Hiển thị danh sách album ở trên
          Container(
            height: 40,
            child: albums.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                final isSelected = album == selectedAlbum;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAlbum = album;
                      currentPage = 0;
                    });
                    _fetchMedia();
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        album.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          // Hiển thị danh sách media ở dưới
          Expanded(
            child: mediaList.isEmpty
                ? const Center(child: Text("No media found"))
                : GridView.builder(
              controller: _scrollController,
              itemCount: mediaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final media = mediaList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OriginalPhotoScreen(media: media),
                        )
                    );
                  },
                  child: FutureBuilder<Uint8List?>(
                    future: media.thumbnailDataWithSize(
                      const ThumbnailSize(200, 200),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}
