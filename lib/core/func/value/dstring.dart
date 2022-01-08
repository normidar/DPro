import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'value.dart';

class DString extends Value {
  String value;
  DString(this.value);

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["str"]!;
    return sprintf(format, [value]);
  }
}
