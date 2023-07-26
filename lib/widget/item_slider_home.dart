import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/core/theme/app_style.dart';

import '../core/common/imagehelper.dart';

class ItemSliderHome extends StatelessWidget {
  const ItemSliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: boxShadow),
        child: ImageHelper.loadFromAsset(AppAssets.imgCover,fit: BoxFit.cover),
      ),
    );
  }
}
