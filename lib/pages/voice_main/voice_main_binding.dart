import 'package:get/get.dart';

import 'voice_main_logic.dart';

class VoiceMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoiceMainLogic());
  }
}