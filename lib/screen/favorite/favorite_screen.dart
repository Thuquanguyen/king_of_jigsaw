import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/utils/app_scaffold.dart';

import '../../core/theme/textstyles.dart';
import '../../language/i18n.g.dart';
import '../../routes/app_pages.dart';
import '../../utils/touchable.dart';
import '../../widget/content.dart';
import 'favorite_controller.dart';

class Favoritescreen extends GetView<FavoriteController> {
  const Favoritescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      hideBackButton: true,
      appBarHeight: 0,
      body: Column(
        children: [
          Expanded(
              child: Content(
            title:
                'Wrapped List Multiple Choice and Right to Left Text Direction',
            child: Obx(() => ChipsChoice<String>.multiple(
                  value: controller.tags.value,
                  onChanged: (val) {
                    controller.tags.value = val;
                    controller.tags.refresh();
                  },
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: controller.options,
                    value: (i, v) => v,
                    label: (i, v) => v,
                    tooltip: (i, v) => v,
                  ),
                  choiceCheckmark: true,
                  textDirection: TextDirection.rtl,
                  wrapped: true,
                )),
          )),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 10.h, bottom: 30.h),
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
                        Get.toNamed(Routes.WELCOME);
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
    );
  }
}
