import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:king_of_jigsaw/utils/app_scaffold.dart';

import '../../admod_handle.dart';
import '../../core/assets/app_assets.dart';
import '../../core/common/imagehelper.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/textstyles.dart';
import '../../language/i18n.g.dart';
import '../../routes/app_pages.dart';
import '../../utils/touchable.dart';
import 'theme_controller.dart';

class ThemeScreen extends GetView<ThemeController> {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      appBarHeight: 0,
      color: Colors.black,
      hideBackButton: true,
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child:
                      ImageHelper.loadFromAsset(AppAssets.icLogo1, height: 50),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.customColor42),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Touchable(
                            onTap: () {
                              controller.isThemeDark.value = true;
                              controller.isAuto.value = false;
                              controller.isThemeDark.refresh();
                              controller.isAuto.refresh();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: ImageHelper.loadFromAsset(
                                      AppAssets.imgThemeDark,
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Dark",
                                  style: TextStyles.caption
                                      .setColor(Colors.black)
                                      .setTextSize(16)
                                      .setHeight(1.4),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Icon(controller.isThemeDark.value
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked))
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Touchable(
                            onTap: () {
                              controller.isThemeDark.value = false;
                              controller.isAuto.value = false;
                              controller.isThemeDark.refresh();
                              controller.isAuto.refresh();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: ImageHelper.loadFromAsset(
                                      AppAssets.imgThemeLight,
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Light",
                                  style: TextStyles.caption
                                      .setColor(Colors.black)
                                      .setTextSize(16)
                                      .setColor(Colors.black)
                                      .setHeight(1.4),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Icon(controller.isThemeDark.value
                                    ? Icons.radio_button_unchecked
                                    : Icons.radio_button_checked))
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )),
                      Container(
                        color: Colors.black,
                        margin: EdgeInsets.only(bottom: 30.h),
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Touchable(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text("Theme Auto",
                                        style: TextStyles.caption
                                            .setColor(Colors.white)
                                            .setTextSize(20)
                                            .setHeight(1.4))),
                                Obx(() => Icon(
                                      controller.isAuto.value
                                          ? Icons.toggle_on
                                          : Icons.toggle_off,
                                      size: 50,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            onTap: () {
                              controller.isAuto.value =
                                  !controller.isAuto.value;
                              controller.isAuto.refresh();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
            const SizedBox(
              height: 10,
            ),
            if (AdmodHandle().ads.isLimit == false)
              Obx(() => Container(
                height: 100,
                width: Get.width,
                color: Colors.white,
                child: AdmodHandle().nativeThemesLoaded.value
                    ? AdWidget(ad: AdmodHandle().nativeAdTheme!)
                    : const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
            Container(
              color: Colors.black,
              padding:
                  EdgeInsets.only(left: 15.w, right: 15.w, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    I18n().selectThemeStr.tr,
                    style: TextStyles.title3.setColor(Colors.white),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Touchable(
                        onTap: () {
                          Get.toNamed(Routes.FAVORITE);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              I18n().doneStr.tr.toUpperCase(),
                              style: TextStyles.headline2
                                  .setColor(Colors.white)
                                  .setHeight(1.2),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
