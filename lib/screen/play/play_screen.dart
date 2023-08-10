import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/core/common/imagehelper.dart';
import 'package:king_of_jigsaw/core/theme/app_colors.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';
import 'package:king_of_jigsaw/utils/app_scaffold.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import 'play_controller.dart';

class PlayScreen extends GetView<PlayController> {
  PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        ImageHelper.loadFromAsset(AppAssets.imgStorge,
            fit: BoxFit.cover, width: Get.width, height: Get.height),
        Container(
          margin: const EdgeInsets.only(top: kBottomNavigationBarHeight),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Touchable(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ImageHelper.loadFromAsset(AppAssets.icBack1,
                          width: 30, height: 30),
                    ),
                    Expanded(
                      child: Center(
                        child: Obx(
                          () => Text(
                            controller
                                    .levelList[controller.index.value].title ??
                                '',
                            style: TextStyles.title1
                                .setColor(AppColors.colorDefault),
                          ),
                        ),
                      ),
                    ),
                    ImageHelper.loadFromAsset(AppAssets.icRefresh,
                        width: 30, height: 30),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(() => ReorderableGridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: controller.column.value,
                            childAspectRatio: controller.widthX.value /
                                controller.heightX.value,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3),
                        itemBuilder: (ctx, index) => Image(
                          key: ValueKey(index),
                          image: controller.listImageK[index].image.image,
                          fit: BoxFit.fill,
                        ),
                        itemCount: controller.listImageK.length,
                        onReorder: (int oldIndex, int newIndex) {
                          final element =
                              controller.listImageK.removeAt(oldIndex);
                          controller.listImageK.insert(newIndex, element);
                          controller.checkSuccess();
                        },
                      ))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                height: 20,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.grey),
                child: Obx(() => LinearProgressIndicator(
                      value: controller.valueProgress.value,
                      color: Colors.red,
                      backgroundColor: AppColors.colorDefault,
                    )),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        )
      ],
    );
  }
}
