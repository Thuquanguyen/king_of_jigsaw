import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:king_of_jigsaw/routes/app_pages.dart';
import 'package:king_of_jigsaw/screen/premium/premium_screen.dart';
import 'package:king_of_jigsaw/utils/app_utils.dart';
import '../../core/common/app_func.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/theme/textstyles.dart';
import '../../in_app_manage.dart';
import '../../utils/touchable.dart';
import 'main_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);
  final bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() =>
          Scaffold(
              drawerEdgeDragWidth: 0,
              body: Column(
                children: [
                  Expanded(
                      child: IndexedStack(
                        index: controller.navMenuIndex(),
                        children: controller.menuPages,
                      ))
                ],
              ),
              floatingActionButton: FloatingActionButton( //Floating action button on Scaffold
                onPressed: () {
                  controller.getFormCamera();
                  //code to execute on button press
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(5.w),
                  child: const Icon(
                    Icons.camera, color: Colors.pinkAccent, size: 40,),
                ), //icon inside button
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation
                  .centerDocked,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.navMenuIndex(),
                items: controller.navMenuItems,
                onTap: (index) {
                  controller.onTapBottomBar(index);
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.colorDefault,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.pink,
                unselectedLabelStyle:
                const TextStyle(color: Colors.pink),
                selectedLabelStyle:
                const TextStyle(color: Colors.white),
                showUnselectedLabels: true,
              ))),
    );
  }
}

extension on MainScreen {

  _buildHeader() =>
      Container(
        color: const Color.fromRGBO(38, 38, 37, 1),
        child: Column(
          children: [
            SizedBox(
              height: Dimens.topSafeAreaPadding,
            ),
            Obx(() =>
                Visibility(
                  visible: controller.isLoadAds.value,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: controller.bannerAd.value.size.width.toDouble(),
                      height: controller.bannerAd.value.size.height.toDouble(),
                      child: AdWidget(
                        ad: controller.bannerAd.value, key: Key("ADSEN"),),
                    ),
                  ),
                )),
            SizedBox(
              height: 10.h,
            ),
            if (controller.navMenuIndex.value != 2)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Touchable(
                      onTap: () {
                        Get.bottomSheet(
                            const PremiumScreen(),
                            isScrollControlled: true
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.stars,
                            color: AppColors.neutralColor9,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.h),
                            child: Text(
                              'Tired of ads?',
                              style: TextStyles.label1,
                            ),
                          )
                        ],
                      )),
                  const Spacer(),
                  Touchable(
                    onTap: () {
                      Get.bottomSheet(
                          const PremiumScreen(),
                          isScrollControlled: true
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Text(
                            'Unlock Premium',
                            style: TextStyles.label1,
                          ),
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: AppColors.neutralColor9,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      );
}
