import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'value.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DString extends Value {
  String value;
  DString(this.value);

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["str"]!;
    return sprintf(format, [value]);
  }
}
