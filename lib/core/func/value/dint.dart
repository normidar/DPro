import 'package:dpro/tran/Tips/language_tip.dart';

import 'value.dart';

class DInt extends Value {
  int value;
  DInt(this.value);

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}
