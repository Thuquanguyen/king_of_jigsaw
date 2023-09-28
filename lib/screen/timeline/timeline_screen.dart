import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/model/data.dart';
import 'package:king_of_jigsaw/core/theme/app_colors.dart';
import 'package:king_of_jigsaw/screen/achievements/achievements_screen.dart';
import 'package:king_of_jigsaw/screen/main/keep_alive_page.dart';
import 'package:king_of_jigsaw/utils/app_utils.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';

import '../../core/theme/textstyles.dart';
import '../../widget/item_image.dart';
import 'timeline_controller.dart';

class TimeLineScreen extends GetView<TimelineController> {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h,),
        Container(
          height: 60,
          color: AppColors.customColor39,
          child: TabBar(
            controller: controller.tabController,
            indicatorColor: Colors.white,
            labelStyle: TextStyles.headline2.copyWith(
                fontWeight: FontWeight.normal, fontSize: 16.sp, height: 1.5),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
              indicatorHeight: 30.0,
              indicatorColor: AppColors.colorDefault,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: controller.tabs,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: controller.tabs
                .map((e) => KeepAlivePage(
                        child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (ctx, index) => ItemImage(
                        baseModel: listImagePremierLeague[index],
                      ),
                      itemCount: listImagePremierLeague.length,
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }
}
