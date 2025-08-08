import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'calling_mode_logic.dart';

class CallingModePage extends GetView<CallingModeLogic> {

  String incrementWithLeadingZeros(String input) {
    int number = int.parse(input) + 1;
    String result = number.toString().padLeft(input.length, '0');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Call-up system'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              'Current seat number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(() {
              return Text(
                controller.currentNum.value.toString(),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: <Widget>[
                GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 37,
                            crossAxisSpacing: 37),
                    itemCount: controller.seatNumbers.length,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: (index == 9 || index == 11)
                                ? Colors.transparent
                                : const Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          controller.seatNumbers[index],
                          style: const TextStyle(fontSize: 30),
                        ),
                      ).gestures(onTap: () {
                        if (index == 11) {
                          controller.currentNum.value = '';
                        } else {
                          if (controller.currentNum.value.length >= 4) {
                            return;
                          }
                          if (index != 9) {
                            if (index == 10) {
                              controller.currentNum.value =
                                  '${controller.currentNum.value}0';
                            } else {
                              controller.currentNum.value =
                                  '${controller.currentNum.value}${controller.seatNumbers[index]}';
                            }
                          }
                        }
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                <Widget>[
                  Expanded(
                      child: Container(
                    height: 62,
                    alignment: Alignment.center,
                    child: const Text(
                      'Call number',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(31))
                          .gestures(onTap: () async {
                    if (controller.currentNum.value.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please input number');
                      return;
                    }
                    controller.flutterTts.stop();
                    controller.flutterTts.speak(
                        '${controller.headerTitle}${controller.currentNum.value}${controller.footerTitle}');
                  })),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    height: 62,
                    alignment: Alignment.center,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(31))
                          .gestures(onTap: () async {
                    if (controller.currentNum.value.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please input number');
                      return;
                    }

                    controller.currentNum.value = incrementWithLeadingZeros(controller.currentNum.value);
                    controller.flutterTts.stop();
                    controller.flutterTts.speak(
                        '${controller.headerTitle}${controller.currentNum.value}${controller.footerTitle}');
                  })),
                ].toRow(mainAxisAlignment: MainAxisAlignment.end)
              ].toColumn(),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(15))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
