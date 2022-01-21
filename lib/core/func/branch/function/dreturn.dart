import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DReturn implements DObject {
  DObject get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("return");
    return sprintf(format, [
      value.tran(tip),
    ]);
  }
}

class OReturn with DReturn {
  @override
  DObject value;

  OReturn({required this.value});
}
