import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

import 'value.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DInt implements Value {
  int get value;

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}

class OInt with DInt {
  @override
  int value;
  OInt(this.value);
}
