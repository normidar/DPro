import 'package:dpro/tran/Tips/language_tip.dart';

import 'dvalue.dart';

abstract class DBool implements Value {
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
