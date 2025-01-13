import 'dart:io';
import 'dart:typed_data';

import 'package:ai_retouch/features/cartoon_ai/presentation/cubit/cubit/cartoon_ai_cubit.dart';
import 'package:ai_retouch/features/cartoon_ai/presentation/cubit/state/cartoon_ai_state.dart';
import 'package:ai_retouch/features/cartoon_ai/presentation/screen/cartoon_ai_pick_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumCartoonMediaScreen extends StatelessWidget {
  const AlbumCartoonMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    scrollController.addListener((){
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        final selectedAlbum = context.read<CartoonAiCubit>().state.selectedAlbum;
        if(selectedAlbum != null){
          context.read<CartoonAiCubit>().loadMoreMedia(selectedAlbum);
        }
        else
          {
            print('No album selected');
          }
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 41.0),
              child: Container(
                width: 375.w,
                height: 48.w,
                color: Color(0xFF1A1A1A),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  color: Color(0xFF1A1A1A)
                              ),
                              child: Image.asset('assets/images/BTN.png'),
                            )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 154.0),
                      child: Container(
                        width: 67.w,
                        height: 24.w,
                        child: Text(
                          'All photos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'PlusJakartaSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 105.0, left: 20.0),
            child: Container(
              width: 148.w,
              height: 20.w,
              child: Text(
                'Try suggested photos',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 133.0),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: 122.w,
                  height: 122.w,
                  child: Image.asset('assets/images/restore1.png'),
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(top: 133.0, left: 127.0),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: 122.w,
                  height: 122.w,
                  child: Image.asset('assets/images/restore2.png'),
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(top: 133.0, left: 253.0),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: 122.w,
                  height: 122.w,
                  child: Image.asset('assets/images/restore3.png'),
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 279.0),
            child: Container(
              width: 375.w,
              height: 481.w,
              child: BlocBuilder<CartoonAiCubit, CartoonAiState>(
                  builder: (context, state){
                    if(state.albums.isEmpty){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return Column(
                      children: [
                        Container(
                          height: 40.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.albums.length,
                            itemBuilder: (context, index){
                              final album = state.albums[index];
                              final isSelected = album == state.selectedAlbum;
                              return GestureDetector(
                                onTap: (){
                                  context.read<CartoonAiCubit>().selectAlbum(album);
                                },
                                child: Container(
                                  width: 80.w,
                                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected ? Colors.blue : Colors.grey.withOpacity(0.5),
                                      width: 0.5.w,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: isSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      album.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                              controller: scrollController,
                              itemCount: state.media.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                              itemBuilder: (context, index){
                                if(index == 0){
                                  return GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                                      if(image != null){
                                        final pickedImage = File(image.path);
                                        // additional trans pickedImage to cartoon ai screen
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => CartoonAiPickScreen(imagePicked: pickedImage,)),
                                        );
                                      }
                                      else
                                        {
                                          print('No image selected');
                                        }
                                    },
                                    child: Container(
                                      color: Colors.black.withOpacity(0.1), 
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }
                                final media = state.media[index - 1];
                                return GestureDetector(
                                  onTap: () async {
                                    final imagePicked = await media.originFile;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CartoonAiPickScreen(imagePicked: imagePicked!))
                                    );
                                  },
                                  child: FutureBuilder<Uint8List?>(
                                      future: media.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
                                      builder: (context, snapshot){
                                        if(snapshot.connectionState == ConnectionState.waiting){
                                          return const CircularProgressIndicator();
                                        }
                                        else if(snapshot.hasError || !snapshot.hasData){
                                          return const Icon(Icons.error);
                                        }
                                        else
                                          {
                                            return Image.memory(
                                              snapshot.data!,
                                              fit: BoxFit.cover,
                                            );
                                          }
                                      }
                                  ),
                                );
                              }
                          ),
                        )
                      ],
                    );
                  }
              )
            ),
          )
        ],
      ),
    );
  }
}
