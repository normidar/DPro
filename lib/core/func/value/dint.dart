import 'package:dpro/tran/Tips/language_tip.dart';

import 'dvalue.dart';

abstract class DInt implements Value {
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
