import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DPara extends DObject {
  DType type;
  String name;
  DPara({required this.type, required this.name});

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["para"]!;
    return sprintf(format, [
      type.tran(tip),
      name,
    ]);
  }
}
