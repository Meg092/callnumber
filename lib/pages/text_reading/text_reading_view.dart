import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:real_voice/main.dart';
import 'package:real_voice/pages/text_reading/voice_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'text_reading_logic.dart';

class TextReadingPage extends GetView<TextReadingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Text reading mode',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                VoiceTextField(
                    value: controller.title,
                    maxLines: 10,
                    maxLength: 500,
                    onChange: (v) {
                      controller.title = v;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Read',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25))
                    .gestures(onTap: () {
                  if (controller.title.isEmpty) {
                    Fluttertoast.showToast(msg: 'Please input text');
                    return;
                  }
                  try {
                    controller.flutterTts.speak(controller.title);
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Reading aloud failed: $e');
                  }
                })
              ].toColumn(),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(15))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
