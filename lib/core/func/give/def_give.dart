import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';

/// 定義して 値を与える　：＝
class DefGive extends DObject {
  String type;
  DObject target;
  DObject content;
  DefGive({required this.target, required this.content, required this.type});

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["def_give"]!;
    String _type = tip.typeMap()[type] ?? type;
    return sprintf(format, [
      _type,
      target.tran(tip),
      content.tran(tip),
    ]);
  }
}
