import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/branch/function/dpara.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

abstract class DParams implements DObject {
  List<DPara> get params;

  @override
  String tran(LanguageTip tip) {
    return params.map((e) => e.tran(tip)).join(", ");
  }
}

class OParams with DParams {
  @override
  List<DPara> params;

  OParams({required this.params});
}
