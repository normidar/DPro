import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DReturn extends DObject {
  DObject value;
  DReturn({required this.value});

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("return");
    return sprintf(format, [
      value.tran(tip),
    ]);
  }
}
