import 'package:cli/tran/Tips/language_tip.dart';

import '../dobject.dart';

class Var extends DObject {
  String name;
  Var(this.name);

  @override
  String tran(LanguageTip tip) {
    return name;
  }
}
