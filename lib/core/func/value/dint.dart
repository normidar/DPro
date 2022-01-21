import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

import 'value.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DInt extends Value {
  int value;
  DInt(this.value);

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }
}

abstract class IInt implements IObject {
  int get value;
  @override
  T toDObject<T extends DObject>() {
    return DInt(value) as T;
  }
}
