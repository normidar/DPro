import 'package:dpro/tran/Tips/language_tip.dart';

import '../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DVar implements DObject {
  String get name;

  @override
  String tran(LanguageTip tip) {
    return name;
  }
}

class OVar with DVar {
  @override
  String name;
  OVar(this.name);
}
