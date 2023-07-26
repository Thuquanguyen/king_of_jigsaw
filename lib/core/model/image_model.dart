import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ImageModel {
  final int? index;
  Image image;

  ImageModel(@required this.image,{this.index});

  @override
  String toString() {
    return 'ImageModel{index: $index, image: $image}';
  }
}
