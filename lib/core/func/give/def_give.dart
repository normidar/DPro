import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()

/// 定義して 値を与える　：＝
class DefGive extends DObject {
  String type;
  DObject target;
  DObject content;
  DefGive({required this.target, required this.content, required this.type});

  @override
  String tran(LanguageTip tip) {
    final defFormat = tip.ruleMap()["def"]!;
    final giveFormat = tip.ruleMap()["give"]!;
    String _type = tip.typeMap()[type] ?? type;

    var targetStr = target.tran(tip);
    // 与える時に定義するかどうかを判定
    if(tip.toString() == "java"){
      targetStr = sprintf(defFormat,[_type, targetStr]);
    }
    return sprintf(giveFormat, [
      targetStr,
      content.tran(tip),
    ]);
  }
}
