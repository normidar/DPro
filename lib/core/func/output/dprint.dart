import 'package:dpro/dpro.dart';
import 'package:sprintf/sprintf.dart';

abstract class DPrint implements DStatement, DRunable {
  DExpression get context;

  static final String statementName = 'print';

  static DPrint formMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    return f.printFunc(TranEngine.formMap(f, m['context']) as DExpression);
  }

  @override
  dynamic run(RunTip tip) {
    tip.output(context.run(tip));
  }

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'context': context.toMap(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* context.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('print');
    return sprintf(format, [
      context.tran(tip),
    ]);
  }
}

class OPrint with DPrint {
  @override
  DExpression context;
  OPrint(this.context);
}
