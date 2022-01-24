import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dconstant.dart';

abstract class DString implements DConstant {
  String get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("str");
    return sprintf(format, [value]);
  }
}

class OString with DString {
  @override
  String value;
  OString(this.value);
}
