import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';

/// 定義して 値を与える　：＝
@AutoExporter()
class DefGive extends DObject {
  DType type;
  DObject target;
  DObject content;
  DefGive({required this.target, required this.content, required this.type});

  @override
  String tran(LanguageTip tip) {
    final defFormat = tip.ruleMap()["def"]!;
    final giveFormat = tip.ruleMap()["give"]!;

    var targetStr = target.tran(tip);
    // 与える時に定義するかどうかを判定
    if (tip.toString() == "java") {
      targetStr = sprintf(defFormat, [type.tran(tip), targetStr]);
    }
    return sprintf(giveFormat, [
      targetStr,
      content.tran(tip),
    ]);
  }
}
