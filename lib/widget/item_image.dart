import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';
import 'package:king_of_jigsaw/routes/app_pages.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';

import '../core/common/imagehelper.dart';
import '../core/model/base_model.dart';
import '../core/theme/app_style.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, this.baseModel});

  final BaseModel? baseModel;

  @override
  Widget build(BuildContext context) {
    return Touchable(
        onTap: () {
          Get.toNamed(Routes.PLayScreen, arguments: baseModel?.icon ?? '');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.symmetric(vertical: 5.h),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: boxShadow),
                child: ImageHelper.loadFromAsset(
                  baseModel?.icon ?? AppAssets.imgCover1,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12),
                  width: 120,
                  height: 20,
                  decoration: BoxDecoration(
                      color: baseModel?.color ?? Colors.red,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      baseModel?.title ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyles.caption
                          .setTextSize(10)
                          .setColor(Colors.white)
                          .setHeight(1.4),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
