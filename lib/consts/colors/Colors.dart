
import 'package:flutter/material.dart';

import '../../utils/pref_util.dart';
import '../strings/str_const.dart';

class ColorStyle {
  static const primary = Color(0xfff68c1f);
  static const secondary = Color(0xffED1F7D);
  static const secondary25 = Color(0x40ED1F7D);
  static const secondary80 = Color(0xcced1f7d);
  static const tertiary = Color(0xfff3cf1b);

  // NEW COLOR FOR DARK MODE
  static Color getSecondaryBackground() {
    if (PrefUtil.getValue(StrConst.isDarkMode, false) as bool == false) {
      return const Color(0xfff8f8f8);
    } else {
      return const Color(0xff1a1a1a);
    }
  }

  static Color getSystemBackground() {
    if (PrefUtil.getValue(StrConst.isDarkMode, false) as bool == false) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  static Color getDarkLabel() {
    if (PrefUtil.getValue(StrConst.isDarkMode, false) as bool == false) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  static Color getLightLabel() {
    if (PrefUtil.getValue(StrConst.isDarkMode, false) as bool == false) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}