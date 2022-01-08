import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DIf extends DObject {
  DObject condition;
  CodeLines lines;
  CodeLines? elseLines;
  DIf({required this.condition, required this.lines, this.elseLines});

  @override
  String tran(LanguageTip tip) {
    String _lineString;
    lines.addIndent();
    final _elseLines = elseLines;
    if (_elseLines == null) {
      _lineString = lines.tran(tip);
    } else {
      _lineString = lines.tran(tip);
      _lineString += "\n" + " " * tip.indent + tip.ruleMap()["else"]! + "\n";
      _elseLines.addIndent();
      _lineString += _elseLines.tran(tip);
    }
    final format = tip.ruleMap()["if"]!;
    return sprintf(format, [
      condition.tran(tip),
      _lineString,
      " " * tip.indent,
    ]);
  }
}
