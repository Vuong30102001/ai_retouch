import 'dart:typed_data';
import 'package:ai_retouch/features/remove_object/presentation/widget/tool_remove_object_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';

class RemoveObjectScreen extends StatefulWidget {
  final AssetEntity media;
  const RemoveObjectScreen({super.key, required this.media});

  @override
  State<RemoveObjectScreen> createState() => _RemoveObjectScreenState();
}

class _RemoveObjectScreenState extends State<RemoveObjectScreen> {
  late Future<Uint8List?> imageData;
  
  @override
  void initState(){
    super.initState();
    imageData = widget.media.thumbnailDataWithSize(const ThumbnailSize(400, 400));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(1.w),
            child: Container(
              height: 100.w,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, bottom: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.dangerous_outlined,
                        size: 20.w,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.w, bottom: 10.w),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.1),
                        fontSize: 15.sp,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
                padding: const EdgeInsets.all(1.0),
              child: FutureBuilder(
                  future: imageData, 
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasError){
                        return const Center(child: Text('Error loading image'),);
                      }
                      else if(snapshot.hasData){
                        Uint8List? imageBytes = snapshot.data;
                        if(imageBytes != null){
                          return Image.memory(
                            imageBytes,
                            fit: BoxFit.contain,
                          );
                        }
                        else {
                          return const Center(child: Text('No image data found'),);
                        }
                      }
                    }
                    return const Center(child: CircularProgressIndicator(),);
                  }
              ),
            ),
          ),
          Container(
            height: 200.w,
            child: const ToolRemoveObjectWidget(),
          ),
        ],
      ),
    );
  }
}
