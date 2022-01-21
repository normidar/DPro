import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/export.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
abstract class DClass implements DObject {
  String get name;
  CodeLines get lines;

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

class OClass with DClass {
  @override
  String name;
  @override
  CodeLines lines;
  OClass({
    required this.name,
    required this.lines,
  });
}
