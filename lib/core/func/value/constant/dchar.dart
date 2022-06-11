import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DChar extends DConstant {
  @override
  String get value;

  static final String statementName = 'char';
  @override
  String get mapStatementName => statementName;

  @override
  dynamic run(RunTip tip) {
    return value;
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('char');
    return sprintf(format, [value.substring(0, 1)]);
  }

  @override
  final DType type = DTypes.dStr;
}

class OChar extends DChar {
  @override
  String value;
  OChar(this.value);
}
