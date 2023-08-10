import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/core/common/imagehelper.dart';
import 'package:king_of_jigsaw/core/model/data.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';
import 'package:king_of_jigsaw/screen/main/keep_alive_page.dart';
import 'package:king_of_jigsaw/widget/item_image.dart';

import '../../core/theme/app_colors.dart';
import '../../widget/item_slider_home.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (ctx, value) => [
            SliverAppBar(
              backgroundColor: Colors.grey[100],
              pinned: true,
              snap: true,
              floating: true,
              elevation: 1.0,
              leading: Container(),
              titleSpacing: 0.0,
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
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
                          SizedBox(
                            height: 180,
                            child: PageView(
                              controller: controller.controllerPage,
                              children: const <Widget>[
                                ItemSliderHome(),
                                ItemSliderHome(),
                                ItemSliderHome()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Obx(() => SliderIndicator(
                                length: 3,
                                activeIndex:
                                    controller.currentIndex.value.round(),
                                indicator: Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                activeIndicator: const Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BubbleTabIndicator(
                  indicatorHeight: 30.0,
                  indicatorColor: AppColors.colorDefault,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
                labelStyle: TextStyles.headline2.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                    height: 1.5),
                padding: EdgeInsets.zero,
                tabs: controller.tabs,
                controller: controller.tabController,
              ),
            )
          ],
          body: TabBarView(
            controller: controller.tabController,
            children: controller.tabs.map((Tab tab) {
              return KeepAlivePage(
                  child: MasonryGridView.count(
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
                  ),);
            }).toList(),
          ),
        ));
  }
}
