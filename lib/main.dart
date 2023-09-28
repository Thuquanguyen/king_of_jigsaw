import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'binding/root_binding.dart';
import 'core/app_translations.dart';
import 'core/common/app_func.dart';
import 'core/service/notification_service.dart';
import 'core/theme/app_themes.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes/app_pages.dart';
import 'screen/main/ads/app_lifecircle_factory.dart';
import 'screen/main/ads/open_app_ads_manage.dart';
import 'utils/app_loading.dart';

void main() {
  void initApp() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp();
    FlutterNativeSplash.remove();
    NotificationService().initializePlatformNotifications();
    AppFunc.initLoadingStyle();
    MobileAds.instance.initialize();
  }

  runZonedGuarded(() async {
    initApp();
    AppTranslations.init();
    initLoadingStyle();
    runApp(
      ScreenUtilInit(
        designSize: const Size(344, 781),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return WillPopScope(
            onWillPop: () async => false,
            child: GetMaterialApp(
                title: "King Of Jigsaw",
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.INITIAL,
                initialBinding: RootBinding(),
                getPages: AppPages.routes,
                locale: AppTranslations.fallbackLocale,
                translations: AppTranslations(),
                theme: AppThemes().general(),
                builder: EasyLoading.init(builder: (context,child) => MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                    child: child!))),
          );
        },
      ),
    );
  }, (Object error, StackTrace stackTrace) {});
}
