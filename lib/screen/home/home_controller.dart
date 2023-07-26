import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/base/base_controller.dart';

class HomeController extends BaseController with SingleGetTickerProviderMixin {
  final controllerPage = PageController(viewportFraction: 0.9);
  RxDouble currentIndex = 0.0.obs;
  final List<Tab> tabs = const <Tab>[
    Tab(text: "All"),
    Tab(text: "Disney"), // Nhân vật
    Tab(text: "Zodiac"), // Cung hoàng đạo
    Tab(text: "Animal"), // Động vât
    Tab(text: "Flower"), // Hoa
    Tab(text: "Sport"), // Thể thao
    Tab(text: "Cartoon"), // hoatj hình
    Tab(text: "Travel"), // Du lịch
    Tab(text: "Fruit"), // Hoa quả
    Tab(text: "Birthday"), // Sinh nhật
    Tab(text: "Miniature universe"), // Vũ trụ thu nhỏ
    Tab(text: "Interior"), // Nội thất
    Tab(text: "Secret"), // Bí ẩn
    Tab(text: "Heart"), // Trái tim
    Tab(text: "Home"), // Nơi trôn
    Tab(text: "Bird"), // Chim
    Tab(text: "Nature"), // Thiên nhiên
    Tab(text: "Charity"), // Việc thiện
    Tab(text: "Luxurious"), // Sang trọng
    Tab(text: "Holiday"), // Ngày lễ
    Tab(text: "Normal"), // Đơn giản
    Tab(text: "Food"), // Thực phẩm
    Tab(text: "Fashion"), // Thời trang
    Tab(text: "Sea"), // Biển
    Tab(text: "Fiction"), // Viễn tưởng
    Tab(text: "Comic"),// truyện tranh
    Tab(text: "Vehicle"), // Phương tiện
    Tab(text: "Art"), // Nghệ thoaatj
    Tab(text: "Reward"), // Phần thưởng
    Tab(text: "Other"), // Khác
  ];

  TabController? tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    controllerPage.addListener(() {
      currentIndex.value = controllerPage.page ?? 0;
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
