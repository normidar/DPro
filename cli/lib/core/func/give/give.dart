// 値を与える　：＝
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';

class Give extends DObject {
  DObject target;
  DObject content;
  Give({required this.target, required this.content});

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["def_give"]!;
    // TODO: type change
    return sprintf(format, [
      target.tran(tip),
      content.tran(tip),
    ]);
  }
}
