import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// get a element from the iterator with index
abstract class DGetElement implements DExpression {
  DExpression get iterator;
  DExpression get index;

  @override
  final String statementName = "get_iterator_element";

  @override
  dynamic run(RunTip tip) => iterator.run(tip)[index.run(tip)];

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* iterator.getIterable();
    yield* index.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("search");
    return sprintf(format, [
      iterator.tran(tip),
      index.tran(tip),
    ]);
  }

  @override
  DType get type => iterator.type.generics.last;
}

class OSearch with DGetElement {
  @override
  DExpression iterator;
  @override
  DExpression index;
  OSearch({required this.iterator, required this.index});
}
