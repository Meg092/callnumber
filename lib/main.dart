import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:real_voice/pages/calling_mode/calling_mode_binding.dart';
import 'package:real_voice/pages/calling_mode/calling_mode_view.dart';
import 'package:real_voice/pages/calling_setting/calling_setting_binding.dart';
import 'package:real_voice/pages/calling_setting/calling_setting_view.dart';
import 'package:real_voice/pages/text_reading/text_reading_binding.dart';
import 'package:real_voice/pages/text_reading/text_reading_view.dart';
import 'package:real_voice/pages/voice_main/voice_main_binding.dart';
import 'package:real_voice/pages/voice_main/voice_main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = const Color(0xffa6b500);
Color bgColor = const Color(0xfff2f2f2);

List<String> voiceLanguages = [
  'en-US',
  'zh-CN',
  'ja-JP',
  'es-ES',
  'fr-FR',
  'de-DE'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final language = prefs.getString('language');
  if (language == null) {
   await prefs.setString('language', voiceLanguages[0]);
   await prefs.setString('header', 'Please ask the ');
   await prefs.setString('footer', 'Customer has finished his meal');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Call,
      initialRoute: '/voiceMain',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          colorScheme: ColorScheme.light(
            primary: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: primaryColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )),
    );
  }
}
List<GetPage<dynamic>> Call = [
  GetPage(name: '/voiceMain', page: () => const VoiceMainPage(), binding: VoiceMainBinding()),
  GetPage(name: '/callingMode', page: () => CallingModePage(), binding: CallingModeBinding()),
  GetPage(name: '/callingSetting', page: () => CallingSettingPage(), binding: CallingSettingBinding()),
  GetPage(name: '/textReading', page: () => TextReadingPage(), binding: TextReadingBinding()),
];