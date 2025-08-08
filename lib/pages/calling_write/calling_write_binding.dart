import 'package:get/get.dart';

import 'calling_write_logic.dart';

class CallingWriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CallingWriteLogic(),
      permanent: true,
    );
  }
}
