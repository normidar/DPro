import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

import 'dobject.dart';
import 'func/output/dprint.dart';

@AutoExporter()
class CodeLines {
  List<DObject> objects;
  CodeLines({required this.objects});
  bool _isAddIndent = false;
  void addIndent() {
    _isAddIndent = true;
  }

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

  String putin(DObject object, LanguageTip tip) {
    return " " * tip.indent + object.tran(tip);
  }
}

abstract class ICodeLines  {
  // FIXME: 
  IObject get context;

  CodeLines toCodeLines() {
    throw Exception();
  }
}