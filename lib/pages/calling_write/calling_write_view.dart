import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calling_write_logic.dart';

class CallingWriteView extends GetView<CallingWriteLogic> {
  const CallingWriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.sporer.value
              ? CircularProgressIndicator(color: Colors.green[400])
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.ntoz();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
