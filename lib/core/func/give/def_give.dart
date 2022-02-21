import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/daction.dart';
import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// 定義して 値を与える　：＝
abstract class DefGive implements DAction {
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
      DType _type = getType();

      targetStr = sprintf(defFormat, [_type.tran(tip), targetStr]);
    }
    return sprintf(giveFormat, [
      targetStr,
      content.tran(tip),
    ]);
  }

  DType getType() {
    DType? _type = type;
    if (_type != null) return _type;
    DObject _content = content;
    if (_content is DConstant) {
      return _content.type;
    }
    throw Exception("this target can not support retype");
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
