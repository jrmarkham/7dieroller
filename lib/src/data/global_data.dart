// USE FOR GLOBAL CONST VARS / TEXT / STYLE / ENUMS /  UTILS
import 'dart:convert';
import 'package:flutter/services.dart';

import 'consts.dart';

export '../ui/style.dart';
export 'enums.dart';
export 'consts.dart';
export 'content.dart';



class GlobalData {
  // consts
  // LANGUAGES AND STYLE

  // localization
  // core text data for app
  static String language;
  static Map<String, dynamic> localization;

  // data


  static Future<void> initGlobalData() async {
    // set core lang to ENGLISH
    language = ENGLISH;
    localization = await getLangData(language);
  }

  // LOCALIZATION
  static Future<Map<String, dynamic>> getLangData(String _language) async {
    String data;
    switch (_language) {
      case ENGLISH:
        data = await rootBundle.loadString('assets/json_files/en/core.json');
        break;
      default:
        data = await rootBundle.loadString('assets/json_files/en/core.json');
        break;
    }
    return json.decode(data);
  }
}
