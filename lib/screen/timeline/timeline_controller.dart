import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController with SingleGetTickerProviderMixin{
  final List<Tab> tabs = <Tab>[
    Tab(text: "Argentina"),
    Tab(text: "France"),
    Tab(text: "Brazil"),
    Tab(text: "England"),
    Tab(text: "Belgium"),
    Tab(text: "Croatia"),
    Tab(text: "Netherlands"),
    Tab(text: "Italy"),
    Tab(text: "Spain"),
    Tab(text: "USA"),
    Tab(text: "Mexico"),
    Tab(text: "Switzerland"),
    Tab(text: "Morocco"),
    Tab(text: "Japan"),
    Tab(text: "Australia"),
    Tab(text: "Korea Republic"),
    Tab(text: "Russia"),
    Tab(text: "Saudi Arabia"),
    Tab(text: "Vietnam"),
    Tab(text: "Indonesia"),
    Tab(text: "China PR"),
    Tab(text: "Hong Kong, China"),
    Tab(text: "Indonesia"),
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
