import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:king_of_jigsaw/screen/every_day/every_day_screen.dart';
import 'package:king_of_jigsaw/screen/home/home_screen.dart';
import 'package:king_of_jigsaw/screen/setting/setting_screen.dart';
import '../../ad_manager.dart';
import '../../core/base/base_controller.dart';
import '../timeline/timeline_screen.dart';
import 'ads/app_lifecircle_factory.dart';
import 'ads/open_app_ads_manage.dart';
import 'component/tab_nav.dart';
import 'keep_alive_page.dart';
import 'model/screen_model.dart';

class MainController extends BaseController {
  final screensData = <ScreenModel>[
    ScreenModel(
        name: "Club Team",
        screen: KeepAlivePage(child: const HomeScreen()),
        navKey: 1,
        icon: Icons.sports_soccer_sharp),
    ScreenModel(name: "", screen: KeepAlivePage(child: SizedBox()), navKey: 5),
    ScreenModel(
        name: "National Team",
        screen: KeepAlivePage(child: const TimeLineScreen()),
        navKey: 2,
        icon: Icons.sports_volleyball_outlined),
  ];

  final navMenuIndex = 0.obs;

  ScreenModel get currentScreenModel => screensData[navMenuIndex()];

  // store the pages stack.
  List<Widget>? _pages;
  Rx<File> imageFile = File("").obs;
  // get navigators.
  List<Widget> get menuPages =>
      _pages ??= screensData.map((e) => TabNav(e)).toList();

  // widget stuffs.
  List<BottomNavigationBarItem> get navMenuItems => screensData.map((e) {
        return BottomNavigationBarItem(icon: Icon(e.icon), label: e.name);
      }).toList();

  void onTapBottomBar(int index) {
    navMenuIndex.value = index;
  }

  void popToRoot() {
    (currentScreenModel.screen as KeepAlivePage).popToRoot();
  }

  Rx<BannerAd> bannerAd = BannerAd(
          size: AdSize(width: 0, height: 0),
          adUnitId: AdManager.bannerAdUnitId,
          listener: BannerAdListener(),
          request: AdRequest())
      .obs;
  RxBool isLoadAds = false.obs;
  AppOpenAd? appOpenAd;

  @override
  void onInit() {
    // TODO: implement onInit
    loadBannerAds();
    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    AppLifecycleReactor(appOpenAdManager: appOpenAdManager)
        .listenToAppStateChanges();
    super.onInit();
  }

  @override
  void dispose() {
    bannerAd.value.dispose();
    super.dispose();
  }

  getFormCamera() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void loadBannerAds() {
    BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd.value = ad as BannerAd;
          isLoadAds.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message} - ${ad.adUnitId}');
          ad.dispose();
        },
      ),
    ).load();
  }
}
