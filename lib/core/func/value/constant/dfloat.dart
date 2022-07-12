import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:dpro/tran/tran_engine.dart';
import 'package:sprintf/sprintf.dart';

abstract class DFloat extends DConstant {
  @override
  double get value;

  static final String statementName = 'float';
  @override
  String get mapStatementName => statementName;

  static DFloat fromMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    return f.floatFunc(m['value']);
  }

  @override
  dynamic run(RunTip tip) {
    return value;
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('float');
    return sprintf(format, [value]);
  }

  @override
  final DType type = DTypes.dFloat;
}

class OFloat extends DFloat {
  @override
  double value;
  OFloat(this.value);
}
