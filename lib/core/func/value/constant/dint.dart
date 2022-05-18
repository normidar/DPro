import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';

import 'dconstant.dart';

abstract class DInt extends DConstant {
  int get value;
  int? get bit;

  @override
  final String statementName = "int";

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
