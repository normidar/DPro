import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dtypes.dart';
import 'package:cli/core/func/branch/dclass.dart';
import 'package:cli/core/func/branch/dfor_i.dart';
import 'package:cli/core/func/branch/dfunc.dart';
import 'package:cli/core/func/branch/if/dif.dart';
import 'package:cli/core/func/calculate/calculate.dart';
import 'package:cli/core/func/give/def_give.dart';
import 'package:cli/core/func/give/give.dart';
import 'package:cli/core/func/output/dprint.dart';
import 'package:cli/core/func/value/dint.dart';
import 'package:cli/core/func/value/dstring.dart';
import 'package:cli/core/func/var.dart';

CodeLines sampleIf() {
  return CodeLines(
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
        lines: CodeLines(objects: [
          DPrint(DString("月ではない")),
          DPrint(DString("月ではない")),
        ]),
        elseLines: CodeLines(objects: [
          DPrint(DString("月です")),
          DPrint(DString("月です")),
        ]),
      ),
    ],
  );
}

CodeLines sampleFor() {
  return CodeLines(
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
          ),
          Give(
            target: Var("sum"),
            content: Calculate("+", Var("sum"), Var("i")),
          ),
        ]),
      ),
      DPrint(Var("sum"))
    ],
  );
}

CodeLines sampleFunc() {
  return CodeLines(
    objects: [
      DFunc(
        type: DTypes.dInt,
        name: "test",
        lines: sampleFor(),
      ),
    ],
  );
}

CodeLines sampleClass() {
  return CodeLines(objects: [
    DClass(
      name: "Dog",
      lines: sampleFunc(),
    )
  ]);
}
