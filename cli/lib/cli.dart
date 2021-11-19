import 'package:cli/core/code_lines.dart';
import 'package:cli/core/func/branch/dif.dart';
import 'package:cli/core/func/calculate/calculate.dart';
import 'package:cli/core/func/give/def_give.dart';
import 'package:cli/core/func/output/dprint.dart';
import 'package:cli/core/func/value/dint.dart';
import 'package:cli/core/func/value/dstring.dart';
import 'package:cli/core/func/var.dart';
import 'package:cli/tran/language_tips.dart';
import 'package:cli/tran/tran_engine.dart';

int calculate() {
  return 6 * 7;
}

String sample() {
  TranEngine.tip = LanguageTips.python;
  return TranEngine.tran(
    codes: CodeLines(
      objects: [
        DefGive(
          target: Var("a"),
          content: DInt(13),
          type: "int",
        ),
        DIf(
          condition: Calculate(
            ">",
            Var("a"),
            DInt(12),
          ),
          lines: CodeLines(objects: [DPrint(DString("月ではない"))]),
        ),
      ],
    ),
  );
}
