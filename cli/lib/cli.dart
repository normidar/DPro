import 'package:cli/core/code_lines.dart';
import 'package:cli/core/func/branch/dfor_i.dart';
import 'package:cli/core/func/branch/dif.dart';
import 'package:cli/core/func/calculate/calculate.dart';
import 'package:cli/core/func/give/def_give.dart';
import 'package:cli/core/func/give/give.dart';
import 'package:cli/core/func/output/dprint.dart';
import 'package:cli/core/func/value/dint.dart';
import 'package:cli/core/func/value/dstring.dart';
import 'package:cli/core/func/var.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:cli/tran/tran_engine.dart';

int calculate() {
  return 6 * 7;
}

String sampleIf(LanguageTip tip) {
  TranEngine.tip = tip;
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

String sampleFor(LanguageTip tip) {
  TranEngine.tip = tip;
  return TranEngine.tran(
    codes: CodeLines(
      objects: [
        DefGive(
          target: Var("max"),
          content: DInt(100),
          type: "int",
        ),
        DefGive(
          target: Var("sum"),
          content: DInt(0),
          type: "int",
        ),
        DForI(
          end: DInt(100),
          lines: CodeLines(objects: [
            Give(
              target: Var("sum"),
              content: Calculate("+", Var("sum"), Var("i")),
            )
          ]),
        ),
        DPrint(Var("sum"))
      ],
    ),
  );
}
