import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_voice/pages/text_reading/voice_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'calling_setting_logic.dart';

class CallingSettingPage extends GetView<CallingSettingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordering Number Text Settings'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<CallingSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: <Widget>[
                  const Text(
                    'Headline copy',
                    style:
                        TextStyle(fontSize: 12, color: const Color(0xff989898)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: VoiceTextField(
                        value: controller.headerTitle,
                        maxLength: 30,
                        onChange: (v) {
                          controller.headerTitle = v;
                        }),
                  ).decorated(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xffd1d1d1))),
                  const SizedBox(height: 10),
                  const Text(
                    'Tail-end copy',
                    style:
                        TextStyle(fontSize: 12, color: const Color(0xff989898)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: VoiceTextField(
                        value: controller.footerTitle,
                        maxLength: 30,
                        onChange: (v) {
                          controller.footerTitle = v;
                        }),
                  ).decorated(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xffd1d1d1))),
                  const SizedBox(height: 10),
                  const Text(
                    'Voice select',
                    style: TextStyle(fontSize: 12, color: Color(0xff989898)),
                  ),
                  Container(
                          width: double.infinity,
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: <Widget>[
                            Expanded(
                                child: Text(
                              controller.language,
                              overflow: TextOverflow.ellipsis,
                            )),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Colors.grey,
                            )
                          ].toRow())
                      .decorated(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xffd1d1d1)))
                      .gestures(onTap: () {
                    controller.selectLanguage(context);
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  <Widget>[
                    Container(
                      width: 138,
                      height: 62,
                      alignment: Alignment.center,
                      child: const Text(
                        'Save',
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
                          controller.save();
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.end)
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
