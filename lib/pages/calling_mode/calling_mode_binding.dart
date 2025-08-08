import 'package:get/get.dart';

import 'calling_mode_logic.dart';

class CallingModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallingModeLogic());
  }
}