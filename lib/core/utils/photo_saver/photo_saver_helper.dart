import 'dart:typed_data';
import 'package:gal/gal.dart';
import 'package:flutter/material.dart';

class PhotoSaverHelper{
  static Future<void> saveImageBytesToGallery(
      BuildContext context,
      Uint8List imageBytes,
      String fileName, {
        String albumName = "AiRetouch",
      }) async {
    try {
      // Save image directly from Uint8List using the Gal.putImageBytes method
      await Gal.putImageBytes(imageBytes, album: albumName);
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image saved to gallery!')),
        );
      }
    } catch (e) {
      print('Error saving image bytes: $e');
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred while saving the image!')),
        );
      }
    }
  }
}