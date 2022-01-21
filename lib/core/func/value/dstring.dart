import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'dvalue.dart';

abstract class DString implements Value {
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
