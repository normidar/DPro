import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DDouble extends DConstant {
  @override
  double get value;

  @override
  final String statementName = 'double';

  @override
  dynamic run(RunTip tip) {
    return value;
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('double');
    return sprintf(format, [value]);
  }

  @override
  final DType type = DTypes.dFloat;
}

class ODouble extends DDouble {
  @override
  double value;
  ODouble(this.value);
}
