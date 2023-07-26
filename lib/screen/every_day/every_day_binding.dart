import 'package:get/get.dart';

import 'every_day_controller.dart';

class EveryDayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EveryDayController(),fenix: true);
  }
}
