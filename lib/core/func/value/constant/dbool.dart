import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

import 'dconstant.dart';

abstract class DBool extends DConstant {
  @override
  bool get value;

  static final String statementName = 'bool';
  @override
  String get mapStatementName => statementName;

  static DBool formMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    return f.boolFunc(m['value']);
  }

  @override
  dynamic run(RunTip tip) {
    return value;
  }

  @override
  String tran(LanguageTip tip) {
    // DBool Function(bool) i = OBool.new;
    return value.toString();
  }

  @override
  final DType type = DTypes.dBool;
}

class OBool extends DBool {
  @override
  bool value;
  OBool(this.value);
}
