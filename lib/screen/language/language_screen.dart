import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:king_of_jigsaw/ad_manager.dart';
import 'package:king_of_jigsaw/core/common/imagehelper.dart';
import 'package:king_of_jigsaw/core/theme/app_colors.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';
import 'package:king_of_jigsaw/language/i18n.g.dart';
import 'package:king_of_jigsaw/routes/app_pages.dart';
import 'package:king_of_jigsaw/utils/app_scaffold.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';
import 'package:king_of_jigsaw/widget/item_language.dart';
import 'package:get/get.dart';

import '../../admod_handle.dart';
import '../../core/assets/app_assets.dart';
import '../../core/theme/dimens.dart';
import '../../utils/app_scaffold.dart';
import 'language_controller.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({Key? key}) : super(key: key);

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
                child: Obx(() => Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: ImageHelper.loadFromAsset(AppAssets.icLogo1,
                              height: 50),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 50),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: AppColors.customColor42),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (ctx, index) => ItemLanguage(
                              index: index,
                              languageModel:
                                  controller.listLanguages.value[index],
                              controller: controller,
                            ),
                            itemCount: controller.listLanguages.length,
                          ),
                        )
                      ],
                    ))),
            const SizedBox(
              height: 10,
            ),
            if ((AdmodHandle().ads.language == 1) &&
                (AdmodHandle().ads.isLimit == false))
              Obx(() => Container(
                    height: 100,
                    width: Get.width,
                    color: Colors.white,
                    child: AdmodHandle().nativeAdIsLoaded.value
                        ? AdWidget(ad: AdmodHandle().nativeAdSmall!)
                        : Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              child: const CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          ),
                  )),
            if ((AdmodHandle().ads.language == 2) &&
                (AdmodHandle().ads.isLimit == false))
              Obx(() => Visibility(
                  visible: AdmodHandle().isLoadedBannerLanguage.value,
                  child: SizedBox(
                    width:
                        AdmodHandle().bannerAdLanguage!.size.width.toDouble(),
                    height:
                        AdmodHandle().bannerAdLanguage!.size.height.toDouble(),
                    child: AdWidget(ad: AdmodHandle().bannerAdLanguage!),
                  ))),
            if ((AdmodHandle().ads.language == 3) &&
                (AdmodHandle().ads.isLimit == false))
              Obx(() => Container(
                    height: 350,
                    width: Get.width,
                    color: Colors.white,
                    child: AdmodHandle().nativeAdIsLoaded.value
                        ? AdWidget(ad: AdmodHandle().nativeAd!)
                        : Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              child: const CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          ),
                  )),
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(left: 15.w, right: 15.w,top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                        I18n().selectLanguageStr.tr,
                        style: TextStyles.title3.setColor(Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Touchable(
                        onTap: () {
                          Get.toNamed(Routes.THEME);
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
