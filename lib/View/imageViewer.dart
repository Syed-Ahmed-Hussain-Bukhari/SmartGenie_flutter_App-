import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  final dynamic imageData;

  const FullScreenImage({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'fullscreenImage',
            child: PhotoView(
              imageProvider: _getImageProvider(imageData),
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(dynamic imageData) {
    if (imageData is Uint8List) {
      return MemoryImage(imageData);
    } else if (imageData is File) {
      return FileImage(imageData);
    } else {
      throw Exception("Unsupported image type");
    }
  }
}