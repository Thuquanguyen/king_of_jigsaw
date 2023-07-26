import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/base/base_controller.dart';
import 'package:image/image.dart' as imglib;
import 'package:king_of_jigsaw/core/common/app_func.dart';

import '../../core/assets/app_assets.dart';
import '../../core/model/image_model.dart';

class PlayController extends BaseController {
  RxList<int> data = [1, 2, 3, 4, 5].obs;
  RxList<ImageModel> listImageK = <ImageModel>[].obs;
  RxInt widthX = 1.obs;
  RxInt heightX = 1.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    String? args = Get.arguments;
    if (args == null) {
      splitImage(AppAssets.imgCover1);
    } else {
      splitImage(args);
    }
    super.onInit();
  }

  splitImage(String imageX) async {
    final ByteData bytes = await rootBundle.load(imageX);
    final Uint8List list = bytes.buffer.asUint8List();
    // convert image to image from image package
    imglib.Image? image = imglib.decodeImage(list);

    int x = 0, y = 0;
    int width = (image!.width / 4).round();
    int height = (image.height / 4).round();

    // split image to parts
    List<imglib.Image> parts = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        parts.add(
            imglib.copyCrop(image, x: x, y: y, width: width, height: height));
        x += width;
      }
      x = 0;
      y += height;
    }
    widthX.value = width;
    heightX.value = height;
    // convert image from image package to Image Widget to display
    List<Image> output = [];
    for (var img in parts) {
      output.add(Image.memory(imglib.encodeJpg(img)));
    }
    for (int i = 0; i < output.length; i++) {
      ImageModel imageModel = ImageModel(output[i], index: i);
      listImageK.value.add(imageModel);
    }
    listImageK.value = (listImageK.value.toList()..shuffle());
    print("listimage = ${listImageK.value}");
    listImageK.refresh();
  }

  void checkSuccess() {
    int index = 0;
    for (int i = 0; i < listImageK.value.length; i++) {
      if ((i + 1 < listImageK.length) &&
          (listImageK[i].index ?? 0) > (listImageK[i + 1].index ?? 0)) {
        return;
      }
      index++;
    }
    if (index == 16) {
      AppFunc.showToast("Configuration!!!");
    }
  }
}
