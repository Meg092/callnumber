import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_to_speech/text_to_speech.dart';

class TextReadingLogic extends GetxController {

  final TextToSpeech tts = TextToSpeech();

  String title = '';

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final language = prefs.getString('language');
    await tts.setLanguage(language ?? 'en-US');
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tts.stop();
    super.onClose();
  }

}
