import 'package:dpro/tran/lang_tips/language_tip.dart';

import '../dstatement.dart';

abstract class DVar implements DStatement {
  String get name;

  @override
  String tran(LanguageTip tip) {
    return name;
  }
}

class OVar with DVar {
  @override
  String name;
  OVar(this.name);
}
