import 'dart:typed_data';

import 'package:ai_retouch/features/remove_object/presentation/cubit/cubit/remove_object_cubit.dart';
import 'package:ai_retouch/features/remove_object/presentation/cubit/state/remove_object_state.dart';
import 'package:ai_retouch/features/remove_object/presentation/screen/remove_object_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';


class AlbumMediaScreen extends StatelessWidget {
  const AlbumMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        final selectedAlbum = context.read<RemoveObjectCubit>().state.selectedAlbum;
        if (selectedAlbum != null) {
          context.read<RemoveObjectCubit>().loadMoreMedia(selectedAlbum);
        } else {
          print('No album selected');
        }
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Albums & Media")),
      body: BlocBuilder<RemoveObjectCubit, RemoveObjectState>(
        builder: (context, state) {
          if (state.albums.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Hiển thị danh sách album ở trên
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.albums.length,
                  itemBuilder: (context, index) {
                    final album = state.albums[index];
                    final isSelected = album == state.selectedAlbum;
                    return GestureDetector(
                      onTap: () {
                        context.read<RemoveObjectCubit>().selectAlbum(album);
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
                          color: isSelected
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.transparent,
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
                child: GridView.builder(
                  controller: _scrollController,
                  itemCount: state.mediaList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    final media = state.mediaList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RemoveObjectScreen(media: media),
                          ),
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

