import 'package:dpro/core/func/value/calculate/calculate.dart';
import 'package:dpro/core/func/value/search/dsearch_list.dart';

import 'export.dart';

CodeLines sampleIf() {
  return CodeLines(
    objects: [
      DefGive(
        target: DVar("a"),
        content: DInt(13),
        type: "int",
      ),
      DIf(
        condition: Calculate(
          ">",
          DVar("a"),
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
        target: DVar("max"),
        content: DInt(100),
        type: "int",
      ),
      DefGive(
        target: DVar("sum"),
        content: DInt(0),
        type: "int",
      ),
      DForI(
        end: DVar("max"),
        lines: CodeLines(objects: [
          Give(
            target: DVar("sum"),
            content: Calculate("+", DVar("sum"), DVar("i")),
          ),
          Give(
            target: DVar("sum"),
            content: Calculate("+", DVar("sum"), DVar("i")),
          ),
        ]),
      ),
      DPrint(DVar("sum"))
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

CodeLines foreachList() {
  return CodeLines(objects: [
    DForE(
        type: DTypes.dStr,
        list: DList(
            type: DTypes.dStr,
            values: [DString("a"), DString("b"), DString("c"), DString("d")]),
        lines: CodeLines(objects: [
          DPrint(DVar("e")),
        ]))
  ]);
}

CodeLines listToMap() {
  return CodeLines(objects: [
    DefGive(
        target: DVar("list"),
        content: DList(type: DTypes.dStr, values: [
          DString("零"),
          DString("壱"),
          DString("弐"),
        ]),
        type: DTypes.dList),
    DForE(
        type: DTypes.dStr,
        list: DVar("list"),
        lines: CodeLines(objects: [
          DPrint(DVar("e")),
        ])),
    DPrint(DSearchList(
      list: DVar("list"),
      index: DInt(1),
    )),
  ]);
}
