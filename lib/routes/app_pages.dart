import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/screen/achievements/achievements_binding.dart';
import 'package:king_of_jigsaw/screen/every_day/every_day_binding.dart';
import 'package:king_of_jigsaw/screen/every_day/every_day_screen.dart';
import 'package:king_of_jigsaw/screen/home/home_binding.dart';
import 'package:king_of_jigsaw/screen/home/home_screen.dart';
import 'package:king_of_jigsaw/screen/play/play_binding.dart';
import 'package:king_of_jigsaw/screen/setting/setting_binding.dart';
import 'package:king_of_jigsaw/screen/setting/setting_screen.dart';
import 'package:king_of_jigsaw/screen/timeline/timeline_binding.dart';
import 'package:king_of_jigsaw/screen/timeline/timeline_screen.dart';
import '../screen/achievements/achievements_screen.dart';
import '../screen/main/main_binding.dart';
import '../screen/main/main_screen.dart';
import '../screen/play/play_screen.dart';
import '../screen/premium/premium_binding.dart';
import '../screen/premium/premium_screen.dart';
import '../screen/privacy/privacy_binding.dart';
import '../screen/privacy/privacy_screen.dart';
import '../screen/splash/splash_binding.dart';
import '../screen/splash/splash_screen.dart';
import '../screen/term/term_binding.dart';
import '../screen/term/term_screen.dart';
import '../screen/welcome/welcome_binding.dart';
import '../screen/welcome/welcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.PLayScreen,
      page: () => PlayScreen(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVERY_DAY,
      page: () => const EveryDayScreen(),
      binding: EveryDayBinding(),
    ),
    GetPage(
      name: _Paths.TIME_LINE,
      page: () => const TimeLineScreen(),
      binding: TimelineBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () => const PremiumScreen(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.TERM,
      page: () => const TermScreen(),
      binding: TermBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => const PrivacyScreen(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.AchievementScreen,
      page: () => const AchievementScreen(),
      binding: AchievementsBinding(),
    ),
  ];
}
