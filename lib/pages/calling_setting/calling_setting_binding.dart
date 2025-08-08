import 'package:get/get.dart';

import 'calling_setting_logic.dart';

class CallingSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallingSettingLogic());
  }
}