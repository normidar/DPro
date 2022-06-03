import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// this is a const list writed in codes
abstract class DList implements DExpression {
  DType? get valueType;
  // TODO: auto guess the type of list
  DType getValueType() => valueType!;
  List<DExpression> get values;

  @override
  final String statementName = 'list';

  @override
  dynamic run(RunTip tip) => values.map((e) => e.run(tip));

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'value_type': valueType?.toMap(),
      'values': values.map((e) => e.toMap()).toList(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this, isFinal: values.isEmpty);
    for (var element in values) {
      yield* element.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('list');
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      getValueType().tran(tip),
      _values.join(', '),
    ]);
  }

  @override
  DType get type {
    return DType(DTypeStrs.dList, generics: [getValueType()]);
  }
}

class OList with DList {
  @override
  DType? valueType;
  @override
  List<DExpression> values;
  OList({
    this.valueType,
    required this.values,
  });
}
