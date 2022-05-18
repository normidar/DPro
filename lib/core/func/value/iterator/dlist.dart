import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// this is a const list writed in codes
abstract class DList implements DConstant {
  DType get valueType;
  List<DStatement> get values;

  @override
  final String statementName = "list";

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this, isFinal: values.isEmpty);
    for (var element in values) {
      yield* element.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("list");
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      valueType.tran(tip),
      _values.join(", "),
    ]);
  }

  @override
  DType get type {
    return DType(DTypeStrs.dList, generics: [valueType]);
  }
}

class OList with DList {
  @override
  DType valueType;
  @override
  List<DStatement> values;
  OList({required this.valueType, required this.values});
}
