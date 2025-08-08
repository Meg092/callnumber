import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_to_speech/text_to_speech.dart';

class CallingModeLogic extends GetxController {

  final TextToSpeech tts = TextToSpeech();

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
    final language = prefs.getString('language') ?? '';
    await tts.setLanguage(language);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tts.stop();
    super.onClose();
  }

}
