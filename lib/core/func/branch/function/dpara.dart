import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DPara implements DObject {
  DType get type;
  String get name;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("para");
    return sprintf(format, [
      type.tran(tip),
      name,
    ]);
  }
}

class OPara with DPara {
  @override
  String name;
  @override
  DType type;

  OPara({required this.type, required this.name});
}
