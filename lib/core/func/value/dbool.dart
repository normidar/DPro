import 'package:cli/tran/Tips/language_tip.dart';

import 'value.dart';

class DBool extends Value {
  bool value;
  DBool(this.value);

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}
