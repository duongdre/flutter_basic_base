import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import '../consts/strings/str_const.dart';

class FuncUlti {
  static bool validateEmail(String email) {
    RegExp emailRegex = RegExp(StrConst.emailRegex);
    return emailRegex.hasMatch(email);
  }
}
