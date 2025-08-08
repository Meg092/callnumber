import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextReadingLogic extends GetxController {

  FlutterTts flutterTts = FlutterTts();

  String title = '';

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final language = prefs.getString('language');
    await flutterTts.setLanguage(language ?? 'en-US');
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    flutterTts.stop();
    super.onClose();
  }

}
