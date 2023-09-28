import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:king_of_jigsaw/core/base/base_controller.dart';
import 'package:image/image.dart' as imglib;
import 'package:king_of_jigsaw/core/common/app_func.dart';
import 'package:king_of_jigsaw/core/common/imagehelper.dart';
import 'package:king_of_jigsaw/core/model/level_model.dart';
import 'package:king_of_jigsaw/core/theme/app_colors.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';
import 'package:king_of_jigsaw/utils/state_builder.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';

import '../../core/assets/app_assets.dart';
import '../../core/model/image_model.dart';
import '../../widget/item_level.dart';

class PlayController extends BaseController {
  RxList<int> data = [1, 2, 3, 4, 5].obs;
  RxList<ImageModel> listImageK = <ImageModel>[].obs;
  RxInt widthX = 1.obs;
  RxInt heightX = 1.obs;
  RxInt index = 0.obs;
  RxInt column = 3.obs;
  RxDouble valueProgress = 1.0.obs;
  RxList<LevelModel> levelList = <LevelModel>[
    LevelModel(
      title: "EASY",
      icon: AppAssets.icBox1,
      isChecked: true,
    ),
    LevelModel(
      title: "MEDIUM",
      icon: AppAssets.icBox2,
      isChecked: false,
      callBack: () {
        PlayController().changeSelected(1);
      },
    ),
    LevelModel(
      title: "HARD",
      icon: AppAssets.icBox3,
      isChecked: false,
    )
  ].obs;
  Timer? _timer;
  RxString images = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    AppFunc.setTimeout(() {
      showBottomSheetChoiceLevel();
    }, 100);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (valueProgress.value == 0) {
          timer.cancel();
        } else {
          valueProgress.value -= 0.01;
        }
      },
    );
  }

  void changeSelected(int index, {Function? callBack}) {
    for (int i = 0; i < levelList.length; i++) {
      levelList[i].isChecked = false;
    }
    levelList[index].isChecked = true;
    this.index.value = index;
    levelList.refresh();
    callBack?.call();
  }

  int getSize() {
    switch (index.value) {
      case 0:
        return 3;
      case 1:
        return 4;
      case 2:
        return 5;
    }
    return 3;
  }


  showBottomSheetChoiceLevel() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (builder) {
          return Container(
            height: Get.height / 3.5,
            color: Colors.transparent,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ...levelList.value.map(
                            (element) {
                              int index = levelList.indexOf(element);
                              return Expanded(
                                child: ItemLevel(
                                  levelModel: element,
                                  playController: this,
                                  index: index,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Touchable(
                        onTap: () {
                          Get.back();
                          startPlay();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.colorDefault,
                              borderRadius: BorderRadius.circular(50.r)),
                          padding: EdgeInsets.symmetric(vertical: 5.w),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Center(
                            child: Text(
                              "Play",
                              style: TextStyles.title1.setColor(Colors.white),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                )),
          );
        });
  }

  timerPause() {
    _timer?.cancel();
  }

  showImagePreview(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: SizedBox.expand(
                  child: ImageHelper.loadFromAsset(images.value)),
            ),
            Expanded(
              flex: 1,
              child: SizedBox.expand(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Dismiss'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  startPlay({bool isRefresh = false}) {
    if (isRefresh) {
      _timer?.cancel();
      _timer = null;
      listImageK.clear();
      valueProgress.value = 1.0;
    }
    column.value = getSize();
    print("column.value = ${column.value}");
    column.refresh();
    String? args = Get.arguments;
    if (args == null) {
      splitImage(AppAssets.imgCover1);
    } else {
      splitImage(args);
      images.value = args;
    }
    startTimer();
  }

  splitImage(String imageX) async {
    final ByteData bytes = await rootBundle.load(imageX);
    final Uint8List list = bytes.buffer.asUint8List();
    // convert image to image from image package
    imglib.Image? image = imglib.decodeImage(list);

    int x = 0, y = 0;
    int width = (image!.width / getSize()).round();
    int height = (image.height / getSize()).round();

    // split image to parts
    List<imglib.Image> parts = [];
    for (int i = 0; i < getSize(); i++) {
      for (int j = 0; j < getSize(); j++) {
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
