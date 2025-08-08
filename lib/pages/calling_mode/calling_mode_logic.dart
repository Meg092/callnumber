import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallingModeLogic extends GetxController {

  final FlutterTts flutterTts = FlutterTts();

  String headerTitle = '';
  String footerTitle = '';
  var currentNum = '001'.obs;
  List<String> seatNumbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '','0','Clean'];

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    headerTitle = prefs.getString('header') ?? '';
    footerTitle = prefs.getString('footer') ?? '';
    final language = prefs.getString('language') ?? 'en-US';
    await flutterTts.setLanguage(language);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    flutterTts.stop();
    super.onClose();
  }

}
