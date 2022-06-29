import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';

abstract class DInt extends DConstant {
  @override
  int get value;

  int? get bit;

  static final String statementName = 'int';
  @override
  String get mapStatementName => statementName;

  static DInt fromMap(Map m) {
    assert(m['statement_name'] == statementName);
    return OInt(m['value']);
  }

  @override
  dynamic run(RunTip tip) {
    return value;
  }

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }

  @override
  final DType type = DTypes.dInt;
}

class OInt extends DInt {
  @override
  int value;

  @override
  int? bit;
  OInt(this.value, {this.bit});
}
