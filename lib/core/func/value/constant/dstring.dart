import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:dpro/tran/tran_engine.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DString extends DConstant {
  @override
  String get value;

  static final String statementName = 'str';
  @override
  String get mapStatementName => statementName;

  static DString formMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    return f.stringFunc(m['value']);
  }

  @override
  dynamic run(RunTip tip) {
    return value;
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('str');
    return sprintf(format, [value]);
  }

  @override
  final DType type = DTypes.dStr;
}

class OString extends DString {
  @override
  String value;
  OString(this.value);
}
