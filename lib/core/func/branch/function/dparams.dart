import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/func/branch/function/dpara.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

import '../../../dobject.dart';

@AutoExporter()
class DParams extends DObject {
  List<DPara> params;
  DParams({required this.params});

  @override
  String tran(LanguageTip tip) {
    return params.map((e) => e.tran(tip)).join(", ");
  }
}
