import 'dart:convert';

import 'package:dpro/dpro.dart';

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

  static DStatement formJson(String json) {
    Map m = jsonDecode(json);
    return formMap(m);
  }

  static DStatement formMap(Map m) {
    final func = formMapTran[m['statement_name']];
    assert(func != null);
    return func!(m);
  }

  static Map<String, DStatement Function(Map)> formMapTran = {
    DBool.statementName: DBool.formMap,
    DChar.statementName: DChar.formMap,
    DString.statementName: DString.formMap,
    DFloat.statementName: DFloat.formMap,
    DInt.statementName: DInt.formMap,
    DPrint.statementName: DPrint.formMap,
    DCodeLines.statementName: DCodeLines.formMap,
    DStrLink.statementName: DStrLink.formMap,
  };
}
