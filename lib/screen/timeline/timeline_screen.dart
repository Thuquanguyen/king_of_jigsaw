import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/model/data.dart';
import 'package:king_of_jigsaw/core/theme/app_colors.dart';
import 'package:king_of_jigsaw/screen/achievements/achievements_screen.dart';
import 'package:king_of_jigsaw/screen/main/keep_alive_page.dart';
import 'package:king_of_jigsaw/utils/app_utils.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';

import '../../widget/item_image.dart';
import 'timeline_controller.dart';

class TimeLineScreen extends GetView<TimelineController> {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: AppColors.customColor39,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 50.w, right: 15.w, bottom: 10.h),
                  height: 30.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: TabBar(
                    controller: controller.tabController,
                    indicatorColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: AppColors.customColor40,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: controller.tabs,
                  ),
                ),
              ),
              Touchable(
                  onTap: () {
                    goToScreen(const AchievementScreen());
                  },
                  child: Container(
                    width: 35.w,
                    height: 35.w,
                    margin: EdgeInsets.only(bottom: 5.h),
                    child: Center(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              padding: EdgeInsets.all(2.w),
                              child: const Icon(
                                Icons.add_alert_outlined,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: const Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              // first tab bar view widget
              KeepAlivePage(
                  child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (ctx, index) => ItemImage(image: listImage[index],),
                itemCount: listImage.length,
              )),

              // second tab bar view widget
              KeepAlivePage(
                  child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (ctx, index) => ItemImage(image: listImage[index],),
                itemCount: listImage.length,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
