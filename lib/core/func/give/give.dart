// 値を与える　：＝
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class Give extends DObject {
  DObject target;
  DObject content;
  Give({required this.target, required this.content});

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["give"]!;
    return sprintf(format, [
      target.tran(tip),
      content.tran(tip),
    ]);
  }
}
