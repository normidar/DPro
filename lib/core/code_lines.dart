import 'package:dpro/tran/lang_tips/language_tip.dart';

import 'dstatement.dart';

abstract class DCodeLines implements DStatement {
  List<DStatement> get objects;
  bool _isAddIndent = false;
  void addIndent() {
    _isAddIndent = true;
  }

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

class OCodeLines with DCodeLines {
  @override
  List<DStatement> objects;
  OCodeLines({required this.objects});
}
