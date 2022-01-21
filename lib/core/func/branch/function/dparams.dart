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

abstract class IParams implements IObject {
  List<IPara> get params;

  @override
  T toDObject<T extends DObject>() {
    return DParams(params: params.map((e) => e.toDObject<DPara>()).toList())
        as T;
  }
}
