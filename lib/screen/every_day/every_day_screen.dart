import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/model/data.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';
import 'package:king_of_jigsaw/widget/item_slider_home.dart';
import '../../core/assets/app_assets.dart';
import '../../core/common/imagehelper.dart';
import '../../widget/item_image.dart';
import 'every_day_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EveryDayScreen extends GetView<EveryDayController> {
  const EveryDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                ImageHelper.loadFromAsset(AppAssets.imgStorge,
                    fit: BoxFit.cover, width: Get.width, height: 260),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: kToolbarHeight - 10,
                    ),
                    Container(
                      width: Get.width,
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const ItemSliderHome(),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              "Tháng bảy",
              textAlign: TextAlign.start,
              style: TextStyles.body1,
            ),
          ),
          MasonryGridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemBuilder: (ctx, index) => ItemImage(
              image: listImage[index],
            ),
            itemCount: listImage.length,
            crossAxisCount: 2,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
