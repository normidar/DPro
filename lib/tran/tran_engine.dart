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

  static DStatement? formJson(String json,
      {FormMapTip tip = defaultFormMapTip}) {
    Map m = jsonDecode(json);
    return fromMap(tip, m);
  }

  static DStatement? fromMap(FormMapTip constrators, Map m) {
    final func = fromMapTran[m['statement_name']];
    assert(func != null);
    return func!(constrators, m);
  }

  static Map<String, Function> fromMapTran = {
    DBool.statementName: DBool.fromMap,
    DString.statementName: DString.fromMap,
    DFloat.statementName: DFloat.fromMap,
    DInt.statementName: DInt.fromMap,
    DPrint.statementName: DPrint.fromMap,
    DCodeLines.statementName: DCodeLines.fromMap,
    // DStrLink.statementName: DStrLink.fromMap,
    // DBiggerEq.statementName: DBiggerEq.fromMap,
    // DBigger.statementName: DBigger.fromMap,
    // DEqual.statementName: DEqual.fromMap,
    // DSmallerEq.statementName: DSmallerEq.fromMap,
    // DSmaller.statementName: DSmaller.fromMap,
    // DUnequal.statementName: DUnequal.fromMap,
    // DAnd.statementName: DAnd.fromMap,
    // DOr.statementName: DOr.fromMap,
    // DDivide.statementName: DDivide.fromMap,
    // DMinus.statementName: DMinus.fromMap,
    // DPlus.statementName: DPlus.fromMap,
    // DTimes.statementName: DTimes.fromMap,
    // DVar.statementName: DVar.fromMap,
    // DDefVariable.statementName: DDefVariable.fromMap,
    // DGive.statementName: DGive.fromMap,
  };
  static const FormMapTip defaultFormMapTip = FormMapTip(
    boolFunc: OBool.new,
    stringFunc: OString.new,
    intFunc: OInt.new,
    floatFunc: OFloat.new,
    printFunc: OPrint.new,
    codeLinesFunc: OCodeLines.new,
  );
}

class FormMapTip {
  final DBool Function(bool) boolFunc;
  final DString Function(String) stringFunc;
  final DInt Function(int) intFunc;
  final DFloat Function(double) floatFunc;
  final DPrint Function(DExpression) printFunc;
  final DCodeLines Function({required List<DStatement> codeLines})
      codeLinesFunc;
  const FormMapTip({
    required this.boolFunc,
    required this.stringFunc,
    required this.printFunc,
    required this.codeLinesFunc,
    required this.floatFunc,
    required this.intFunc
  });
}
