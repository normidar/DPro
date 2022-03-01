import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

// TODO: make it be new
abstract class DCall implements DValue {
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

class OCall with DCall {
  @override
  String className;
  @override
  List<DObject> parameters;

  OCall({
    required this.className,
    this.parameters = const [],
  });
}
