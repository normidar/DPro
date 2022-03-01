import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DFloat implements DConstant {
  double get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("float");
    return sprintf(format, [value]);
  }

  @override
  final DType type = DTypes.dFloat;
}

class OFloat with DFloat {
  @override
  double value;
  OFloat(this.value);
}
