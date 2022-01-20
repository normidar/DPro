import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/export.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DClass extends DObject {
  String name;
  CodeLines lines;
  DClass({
    required this.name,
    required this.lines,
  });

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("class");
    return sprintf(format, [
      name,
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}

abstract class IClass implements IObject {
  String get name;
  ICodeLines get lines;
  @override
  DObject toDObject() {
    return DClass(name: name, lines: lines.toCodeLines());
  }
}
