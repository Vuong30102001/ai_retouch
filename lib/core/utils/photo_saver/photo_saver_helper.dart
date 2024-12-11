import 'dart:typed_data';
import 'package:gal/gal.dart';
import 'package:flutter/material.dart';

class PhotoSaverHelper{
  static Future<void> saveImageBytesToGallery(
      BuildContext context,
      Uint8List imageBytes,
      String fileName, {
        String albumName = "MyAppImages",
      }) async {
    try {
      // Save image directly from Uint8List using the Gal.putImageBytes method
      await Gal.putImageBytes(imageBytes, album: albumName);  // Don't check return value

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image saved to gallery!')),
      );
    } catch (e) {
      print('Error saving image bytes: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred while saving the image!')),
      );
    }
  }
}