import 'package:cli/core/code_lines.dart';
import 'package:cli/core/func/give/def_give.dart';
import 'package:cli/core/func/value/dint.dart';
import 'package:cli/core/func/var.dart';
import 'package:cli/tran/tran_engine.dart';

int calculate() {
  return 6 * 7;
}

String sample() {
  return TranEngine.tran(
    codes: CodeLines(
      objects: [
        DefGive(
          target: Var("a"),
          content: DInt(12),
          type: "int",
        ),
      ],
    ),
  );
}
