import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class EnhancePhotoScreen extends StatefulWidget {
  final AssetEntity media;
  const EnhancePhotoScreen({super.key, required this.media});

  @override
  State<EnhancePhotoScreen> createState() => _EnhancePhotoScreenState();
}

class _EnhancePhotoScreenState extends State<EnhancePhotoScreen> {
  late Future<Uint8List?> imageData;

  @override
  void initState(){
    super.initState();
    imageData = widget.media.thumbnailDataWithSize(const ThumbnailSize(400, 400));
  }
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhance photo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Uint8List?>(
                future: imageData,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      return Image.memory(
                        snapshot.data!,
                        fit: BoxFit.contain,
                        width: screenWidth,
                        height: screenHeight,
                      );
                    }

                    else{
                      return const Center(child: Text('No image data found'),);
                    }
                  }
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
            )
          )
        ],
      )
    );
  }
}
