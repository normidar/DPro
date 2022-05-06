import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DNew implements DExpression {
  String get className;
  List<DStatement> get parameters;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("new");
    final _paras = parameters.map((e) => e.tran(tip)).join(", ");
    return sprintf(format, [
      className,
      _paras,
    ]);
  }

  @override
  DType get type => DType(className);
}

class ONew with DNew {
  @override
  String className;
  @override
  List<DStatement> parameters;

  ONew({
    required this.className,
    this.parameters = const [],
  });
}