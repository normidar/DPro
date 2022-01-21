import 'package:dpro/core/dobject.dart';
import 'package:dpro/export.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import 'value.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DString implements Value {
  String get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("str");
    return sprintf(format, [value]);
  }
}

class OString with DString {
  @override
  String value;
  OString(this.value);
}
