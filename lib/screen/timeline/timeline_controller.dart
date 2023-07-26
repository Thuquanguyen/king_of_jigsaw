import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController with SingleGetTickerProviderMixin{
  final List<Tab> tabs = <Tab>[
    Tab(text: "Featured"),
    Tab(text: "Popular"),
  ];

  TabController? tabController;

  @override
  void onInit() {
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
