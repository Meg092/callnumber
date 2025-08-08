import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_voice/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'voice_main_logic.dart';

class VoiceMainPage extends StatefulWidget {
  const VoiceMainPage({super.key});

  @override
  State<VoiceMainPage> createState() => _VoiceMainPageState();
}

class _VoiceMainPageState extends State<VoiceMainPage> {
  VoiceMainLogic controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _item(int index) {
    final titles = ['Ordering Number Text Settings', 'About app'];
    return Container(
      width: double.infinity,
      height: 40,
      child: <Widget>[
        Expanded(child: Text(titles[index])),
        index == 0
            ? const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Colors.grey,
              )
            : Obx(() {
                return Text(
                  controller.appVersion.value,
                  style: const TextStyle(color: Colors.grey),
                );
              })
      ].toRow(),
    ).gestures(onTap: () {
      if (index == 0) {
        Get.toNamed('/callingSetting');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: <Widget>[
      const SizedBox(
        width: double.infinity,
        height: double.infinity,
      ),
      Image.asset(
        'assets/bg.png',
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
      const Positioned(
          top: 100,
          left: 15,
          child: Text(
            'Real human voice\nCall number device',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          )),
      SizedBox(
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
                Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: <Widget>[
                    Image.asset(
                      'assets/icon0.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Call-up system',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ].toRow(),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(45))
                    .gestures(onTap: () {
                      Get.toNamed('/callingMode');
                }),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: <Widget>[
                    Image.asset(
                      'assets/icon1.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Text reading mode',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ].toRow(),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(45))
                    .gestures(onTap: () {
                      Get.toNamed('/textReading');
                }),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[_item(0), _item(1)].toColumn(
                      separator: Divider(
                    height: 15,
                    color: Colors.grey[300],
                  )),
                ).decorated(
                    color: const Color(0xfff2f2f2),
                    borderRadius: BorderRadius.circular(15))
              ].toColumn(),
            ).decorated(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            )
          ].toColumn(),
        ).marginOnly(left: 15, right: 15, top: 200)),
      )
    ].toStack());
  }
}