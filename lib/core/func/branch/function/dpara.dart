import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/export.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
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

abstract class OPara with DPara {
  @override
  String name;
  @override
  DType type;

  OPara({required this.type, required this.name});
}
