import 'package:dpro/tran/lang_tips/language_tip.dart';

import 'dstatement.dart';

abstract class DCodeLines<T extends DStatement> implements DStatement {
  List<T> get objects;
  bool _isAddIndent = false;

  void addIndent() {
    _isAddIndent = true;
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    for (var element in objects) {
      yield* element.getIterable();
    }
  }

  /// codeline will auto remove the indent after tran
  @override
  String tran(LanguageTip tip) {
    if (_isAddIndent) tip.addIndent();
    String rt = "";
    for (var i = 0; i < objects.length; i++) {
      if (i == objects.length - 1) {
        rt += putin(objects[i], tip);
        break;
      }
      rt += putin(objects[i], tip) + "\n";
    }
    if (_isAddIndent) tip.removeIndent();
    return rt;
  }

  String putin(DStatement object, LanguageTip tip) {
    return " " * tip.indent + object.tran(tip);
  }
}

class OCodeLines<T extends DStatement> with DCodeLines<T> {
  @override
  List<T> objects;
  OCodeLines({required this.objects});
}
