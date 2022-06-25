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
    return formMap(tip, m);
  }

  static DStatement? formMap(FormMapTip constrators, Map m) {
    final func = formMapTran[m['statement_name']];
    assert(func != null);
    return func!(constrators, m);
  }

  static Map<String, Function> formMapTran = {
    DBool.statementName: DBool.formMap,
    DString.statementName: DString.formMap,
    // DFloat.statementName: DFloat.formMap,
    // DInt.statementName: DInt.formMap,
    DPrint.statementName: DPrint.formMap,
    DCodeLines.statementName: DCodeLines.formMap,
    // DStrLink.statementName: DStrLink.formMap,
    // DBiggerEq.statementName: DBiggerEq.formMap,
    // DBigger.statementName: DBigger.formMap,
    // DEqual.statementName: DEqual.formMap,
    // DSmallerEq.statementName: DSmallerEq.formMap,
    // DSmaller.statementName: DSmaller.formMap,
    // DUnequal.statementName: DUnequal.formMap,
    // DAnd.statementName: DAnd.formMap,
    // DOr.statementName: DOr.formMap,
    // DDivide.statementName: DDivide.formMap,
    // DMinus.statementName: DMinus.formMap,
    // DPlus.statementName: DPlus.formMap,
    // DTimes.statementName: DTimes.formMap,
    // DVar.statementName: DVar.formMap,
    // DDefVariable.statementName: DDefVariable.formMap,
    // DGive.statementName: DGive.formMap,
  };
  static const FormMapTip defaultFormMapTip = FormMapTip(
    boolFunc: OBool.new,
    stringFunc: OString.new,
    printFunc: OPrint.new,
    codeLinesFunc: OCodeLines.new,
  );
}

class FormMapTip {
  final DBool Function(bool) boolFunc;
  final DString Function(String) stringFunc;
  final DPrint Function(DExpression) printFunc;
  final DCodeLines Function({required List<DStatement> codeLines})
      codeLinesFunc;
  const FormMapTip({
    required this.boolFunc,
    required this.stringFunc,
    required this.printFunc,
    required this.codeLinesFunc,
  });
}
