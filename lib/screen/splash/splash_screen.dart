import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/assets/app_assets.dart';
import '../../core/common/imagehelper.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/textstyles.dart';
import '../../utils/app_scaffold.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    if (isCheck) {
      isCheck = false;
      controller.onInitApp();
    }
    return AppScaffold(
      color: Colors.transparent,
      paddingTop: 0,
      body: Container(
          child: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: ImageHelper.loadFromAsset(
              AppAssets.imgBackground,
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                const Spacer(),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('King Of Jigsaw',
                        textStyle: TextStyles.defaultStyle
                            .setTextSize(30.sp)
                            .setColor(AppColors.customColor33)
                            .copyWith(
                                fontFamily: GoogleFonts.amaranth().fontFamily),
                        speed: const Duration(milliseconds: 100)),
                  ],
                  isRepeatingAnimation: false,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      )),
      appBarHeight: 0,
      hideAppBar: true,
      hideBackButton: true,
    );
  }
}
