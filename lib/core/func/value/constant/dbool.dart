import 'package:dpro/tran/Tips/language_tip.dart';

import 'dconstant.dart';

abstract class DBool implements DConstant {
  bool get value;

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}

class OBool with DBool {
  @override
  bool value;
  OBool(this.value);
}
