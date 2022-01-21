import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DIf implements DObject {
  DObject get condition;
  DCodeLines get lines;
  DCodeLines? get elseLines;

  @override
  String tran(LanguageTip tip) {
    String _lineString;
    lines.addIndent();
    final _elseLines = elseLines;
    if (_elseLines == null) {
      _lineString = lines.tran(tip);
    } else {
      _lineString = lines.tran(tip);
      _lineString += "\n" + " " * tip.indent + tip.getRule("else") + "\n";
      _elseLines.addIndent();
      _lineString += _elseLines.tran(tip);
    }
    final format = tip.getRule("if");
    return sprintf(format, [
      condition.tran(tip),
      _lineString,
      " " * tip.indent,
    ]);
  }
}

class OIf with DIf {
  @override
  DObject condition;
  @override
  DCodeLines lines;
  @override
  DCodeLines? elseLines;
  OIf({required this.condition, required this.lines, this.elseLines});
}
