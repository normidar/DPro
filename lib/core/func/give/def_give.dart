import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';

/// 定義して 値を与える　：＝
@AutoExporter()
abstract class DefGive implements DObject {
  DType? get type;
  DObject get target;
  DObject get content;

  @override
  String tran(LanguageTip tip) {
    final defFormat = tip.getRule("def");
    final giveFormat = tip.getRule("give");

    var targetStr = target.tran(tip);
    // 与える時に定義するかどうかを判定
    if (tip.toString() == "java") {
      DType _type = type ?? DType.fromValue(content);
      targetStr = sprintf(defFormat, [_type.tran(tip), targetStr]);
    }
    return sprintf(giveFormat, [
      targetStr,
      content.tran(tip),
    ]);
  }
}

class ODefGive with DefGive {
  @override
  DType? type;
  @override
  DObject target;
  @override
  DObject content;
  ODefGive({required this.target, required this.content, this.type});
}
