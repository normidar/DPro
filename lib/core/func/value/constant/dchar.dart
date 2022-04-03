import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DChar implements DConstant {
  String get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("char");
    return sprintf(format, [value]);
  }

  @override
  final DType type = DTypes.dStr;
}

class OString with DChar {
  @override
  String value;
  OString(this.value);
}
