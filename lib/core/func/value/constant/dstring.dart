import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DString implements DConstant {
  String get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("str");
    return sprintf(format, [value]);
  }

  @override
  final DType type = DTypes.dStr;
}

class OString with DString {
  @override
  String value;
  OString(this.value);
}
