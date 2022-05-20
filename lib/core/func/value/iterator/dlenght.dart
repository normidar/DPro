import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// this must be a function, to support like python
abstract class DLenght implements DExpression {
  DExpression get iterator;

  @override
  final String statementName = "get_iterator_lenght";

  @override
  dynamic run(RunTip tip) => iterator.run(tip).length;

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* iterator.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("len");
    return sprintf(format, [
      iterator.tran(tip),
    ]);
  }

  @override
  DType type = DTypes.dInt;
}

class OLenght with DLenght {
  @override
  DExpression iterator;
  OLenght({required this.iterator});
}
