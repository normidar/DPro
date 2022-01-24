import 'package:dpro/tran/Tips/language_tip.dart';

import 'dconstant.dart';

abstract class DInt implements DConstant {
  int get value;

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}

class OInt with DInt {
  @override
  int value;
  OInt(this.value);
}
