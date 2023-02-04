import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../consts/strings/str_const.dart';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(StrConst.languageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode =
      _prefs.getString(StrConst.languageCode) ?? StrConst.englishLanguageCode;
  return _locale(languageCode);
}

Future<String> getCountryCode() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode =
      _prefs.getString(StrConst.languageCode) ?? StrConst.englishLanguageCode;
  switch (languageCode) {
    case StrConst.englishLanguageCode:
      return StrConst.englishCountryCode;
    default:
      return StrConst.englishCountryCode;
  }
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case StrConst.englishLanguageCode:
      return Locale(StrConst.englishLanguageCode, StrConst.englishCountryCode);
    default:
      return Locale(StrConst.englishLanguageCode, StrConst.englishCountryCode);
  }
}
