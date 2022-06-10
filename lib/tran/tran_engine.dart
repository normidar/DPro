import 'dart:convert';

import 'package:dpro/core/code_lines.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:dpro/tran/language_tips.dart';

class TranEngine {
  static LanguageTip tip = LanguageTips.java;
  static String tran({required DCodeLines codes}) {
    String rt = '';
    for (var i in codes.codeLines) {
      rt += i.tran(tip) + '\n';
    }
    return rt;
  }

  static String toJson({required DCodeLines codes, bool isReadAble = true}) {
    // return jsonEncode(codes.toMap());
    if (isReadAble) {
      final encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(codes.toMap());
    } else {
      final encoder = JsonEncoder();
      return encoder.convert(codes.toMap());
    }
  }
}
