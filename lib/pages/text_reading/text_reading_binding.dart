import 'package:get/get.dart';

import 'text_reading_logic.dart';

class TextReadingBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => TextReadingLogic());
  }
}