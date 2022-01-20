
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DPrint extends DObject {
  DObject context;
  DPrint(this.context);

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("print");
    return sprintf(format, [
      context.tran(tip),
    ]);
  }
}

abstract class IPrint implements IObject {
  IObject get context;
  @override
  DObject toDObject() {
    return DPrint(context.toDObject());
  }
}