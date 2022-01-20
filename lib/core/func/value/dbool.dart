import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

import 'value.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DBool extends Value {
  bool value;
  DBool(this.value);

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}
abstract class IBool implements IObject{
  bool get value;
  @override
  DObject toDObject() {
    return DBool(value);
  }
}
