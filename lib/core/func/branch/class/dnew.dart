import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DNew implements DValue {
  String get className;
  List<DObject> get parameters;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("new");
    final _paras = parameters.map((e) => e.tran(tip)).join(", ");
    return sprintf(format, [
      className,
      _paras,
    ]);
  }
}

class ONew with DNew {
  @override
  String className;
  @override
  List<DObject> parameters;

  ONew({
    required this.className,
    required this.parameters,
  });
}
