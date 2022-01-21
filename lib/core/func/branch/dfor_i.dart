import 'package:dpro/core/func/value/dint.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../code_lines.dart';
import '../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DForI implements DObject {
  DObject get begin;
  DObject get end;
  DObject get step;
  DCodeLines get lines;
  String get varName;
  // 簡略化できるかどうか
  bool get canSimpler;

  @override
  String tran(LanguageTip tip) {
    if (canSimpler) {
      return tranOnlyMax(tip);
    }
    return tranDefault(tip);
  }

  String tranOnlyMax(LanguageTip tip) {
    if (tip.toString() == "python") {
      lines.addIndent();
      final format = tip.getRule("fori_easy");
      return sprintf(format, [
        varName,
        end.tran(tip),
        lines.tran(tip),
      ]);
    }
    return tranDefault(tip);
  }

  String tranDefault(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("fori");
    return sprintf(format, [
      begin.tran(tip),
      end.tran(tip),
      step.tran(tip),
      lines.tran(tip),
      " " * tip.indent,
      varName,
    ]);
  }
}

class OForI with DForI {
  @override
  late DObject begin;
  @override
  DObject end;
  @override
  late DObject step;
  @override
  DCodeLines lines;
  @override
  String varName;
  // 簡略化できるかどうか
  @override
  bool canSimpler = false;
  OForI({
    DObject? begin,
    required this.end,
    DObject? step,
    required this.lines,
    this.varName = "i",
  }) {
    this.begin = begin ?? OInt(0);
    this.step = step ?? OInt(1);
    final _begin = this.begin;
    final _step = this.step;
    if (_begin is DInt &&
        _step is DInt &&
        _begin.value == 0 &&
        _step.value == 1) {
      canSimpler = true;
    }
  }
}
