import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_scaffold.dart';
import 'setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        paddingTop: 0,
        hideBackButton: true,
        hideAppBar: true,
        color: Colors.black,
        body: Container());
  }
}
