import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

import 'value.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DBool implements Value {
  bool get value;

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}

class OBool with DBool {
  @override
  bool value;
  OBool(this.value);
}
