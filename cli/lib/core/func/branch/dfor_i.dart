import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dobject.dart';
import 'package:cli/core/func/value/dint.dart';
import 'package:cli/tran/Tips/language_tip.dart';

class DForI extends DObject {
  DObject begin;
  late DObject end;
  late DObject step;
  CodeLines lines;
  DForI({
    required this.begin,
    required this.lines,
    DObject? end,
    DObject? step,
  }) {
    this.end = end ?? DInt(0);
    this.step = step ?? DInt(1);
  }

  @override
  String tran(LanguageTip tip) {
    // TODO: implement tran
    throw UnimplementedError();
  }
}
