import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';

class Calculate extends DObject {
  String calStr;
  DObject left;
  DObject right;
  Calculate(this.calStr, this.left, this.right);

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["cal"]!;
    return sprintf(format, [
      left.tran(tip),
      calStr,
      right.tran(tip),
    ]);
  }
}
