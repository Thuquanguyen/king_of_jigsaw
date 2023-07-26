import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/routes/app_pages.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';

import '../core/common/imagehelper.dart';
import '../core/theme/app_style.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Touchable(
        onTap: () {
          Get.toNamed(Routes.PLayScreen,arguments: image);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: boxShadow),
            child: ImageHelper.loadFromAsset(image ?? AppAssets.imgCover1,
                fit: BoxFit.cover),
          ),
        ));
  }
}
