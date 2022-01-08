import 'package:dpro/tran/Tips/language_tip.dart';

import '../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DVar extends DObject {
  String name;
  DVar(this.name);

  @override
  String tran(LanguageTip tip) {
    return name;
  }
}
