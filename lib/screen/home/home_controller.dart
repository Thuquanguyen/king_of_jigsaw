import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/core/base/base_controller.dart';
import 'package:king_of_jigsaw/core/common/app_data.dart';
import 'package:king_of_jigsaw/core/common/app_func.dart';
import 'package:king_of_jigsaw/core/common/imagehelper.dart';
import 'package:king_of_jigsaw/core/model/base_model.dart';
import 'package:king_of_jigsaw/core/model/data.dart';
import 'package:king_of_jigsaw/core/theme/textstyles.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final controllerPage = PageController(viewportFraction: 0.9);
  RxInt currentIndex = 0.obs;
  RxList<Tab> tabs = <Tab>[
    Tab(
      child: AppFunc().buildTabView(AppData().listTitles.value[0]),
    ),
    // Anh
    Tab(child: AppFunc().buildTabView(AppData().listTitles.value[1])),
    // tây ban nha
    Tab(child: AppFunc().buildTabView(AppData().listTitles.value[2])),
    // Ý
    Tab(child: AppFunc().buildTabView(AppData().listTitles.value[3])),
    // Đức
    Tab(child: AppFunc().buildTabView(AppData().listTitles.value[4])),
    // Pháp
    Tab(child: AppFunc().buildTabView(AppData().listTitles.value[5])),
    // Mỹ
    Tab(child: AppFunc().buildTabView(AppData().listTitles.value[6])),
    // Ả rập
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[7])),
    // // Brazil
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[8])),
    // // Argentina
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[9])),
    // // Bồ đào nha
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[10])),
    // // Hà Lan
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[11])),
    // // Hàn Quốc
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[12])),
    // // Nhật Bản
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[13])),
    // // Thái Lan
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[14])),
    // // Viet Nam
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[15])),
    // // Indonesia
    // Tab(child: AppFunc().buildTabView(AppData().listTitles.value[16]))
  ].obs;

  TabController? tabController;

  List<List<BaseModel>> listData = [
    listImagePremierLeague,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
    listImageLaliga,
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    controllerPage.addListener(() {
      currentIndex.value = (controllerPage.page ?? 0).toInt();
      currentIndex.refresh();
    });
    tabController = TabController(vsync: this, length: tabs.length);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();
    super.dispose();
  }

}
