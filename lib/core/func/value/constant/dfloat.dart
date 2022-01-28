import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DFloat implements DConstant {
  double get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("float");
    return sprintf(format, [value]);
  }
}

class OFloat with DFloat {
  @override
  double value;
  OFloat(this.value);
}
