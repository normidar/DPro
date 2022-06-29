import 'package:dpro/dpro.dart';

abstract class DCodeLines<T extends DStatement>
    implements DStatement, DRunable {
  List<T> get codeLines;
  bool _isAddIndent = false;

  static final String statementName = 'code_lines';

  @override
  dynamic run(RunTip tip) {
    for (var e in codeLines) {
      final _e = e;
      if (_e is DRunable) {
        (_e as DRunable).run(tip);
      }
    }
  }

  static DCodeLines fromMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    final codeList = m['code_lines'];
    List<DStatement> codes = [];
    for (var e in codeList) {
      codes.add(TranEngine.fromMap(f, e)!);
    }
    return f.codeLinesFunc(codeLines: codes);
  }

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'code_lines': codeLines.map((e) => e.toMap()).toList()
    };
  }

  void addIndent() {
    _isAddIndent = true;
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    for (var element in codeLines) {
      yield* element.getIterable();
    }
  }

  /// codeline will auto remove the indent after tran
  @override
  String tran(LanguageTip tip) {
    if (_isAddIndent) tip.addIndent();
    String rt = '';
    for (var i = 0; i < codeLines.length; i++) {
      if (i == codeLines.length - 1) {
        rt += putin(codeLines[i], tip);
        break;
      }
      rt += putin(codeLines[i], tip) + '\n';
    }
    if (_isAddIndent) tip.removeIndent();
    return rt;
  }

  String putin(DStatement object, LanguageTip tip) {
    return ' ' * tip.indent + object.tran(tip);
  }
}

class OCodeLines<T extends DStatement> with DCodeLines<T> {
  @override
  List<T> codeLines;
  OCodeLines({required this.codeLines});
}
