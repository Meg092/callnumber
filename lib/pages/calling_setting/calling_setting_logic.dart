import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:real_voice/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallingSettingLogic extends GetxController {
  String headerTitle = '';
  String footerTitle = '';
  String language = '';

  void selectLanguage(BuildContext context) async {
    BottomPicker(
      pickerTitle: const Text(''),
      items: voiceLanguages.map((e) => Text(e)).toList(),
      onSubmit: (value) async {
        language = voiceLanguages[value];
        update();
      },
    ).show(context);
  }

  void save() async {
    if (headerTitle.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter header title');
      return;
    }
    if (footerTitle.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter footer title');
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    await prefs.setString('header', headerTitle);
    await prefs.setString('footer', footerTitle);
    Fluttertoast.showToast(msg: 'Save success');
    Get.back();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    headerTitle = prefs.getString('header') ?? '';
    footerTitle = prefs.getString('footer') ?? '';
    language = prefs.getString('language') ?? '';
    update();
    super.onInit();
  }
}
