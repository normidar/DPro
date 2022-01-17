import 'package:dpro/core/func/branch/function/dpara.dart';
import 'package:dpro/core/func/reset/dreset_map.dart';
import 'package:dpro/core/func/value/calculate/calculate.dart';
import 'package:dpro/core/func/value/iterator/dsearch.dart';

import 'export.dart';

CodeLines sampleIf() {
  return CodeLines(
    objects: [
      DefGive(
        target: DVar("a"),
        content: DInt(13),
        type: DTypes.dInt,
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
        type: DTypes.dInt,
      ),
      DefGive(
        target: DVar("sum"),
        content: DInt(0),
        type: DTypes.dInt,
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
        paras: [
          DPara(type: DTypes.dStr, name: "param1"),
          DPara(type: DTypes.dStr, name: "param2"),
        ],
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
      target: DVar("mylist"),
      content: DList(type: DTypes.dStr, values: [
        DString("零"),
        DString("壱"),
        DString("弐"),
      ]),
    ),
    DefGive(
      target: DVar("mymap"),
      content: DMap(
        keyType: DTypes.dStr,
        valueType: DTypes.dStr,
        map: {},
      ),
    ),
    DForE(
        type: DTypes.dStr,
        list: DVar("mylist"),
        lines: CodeLines(objects: [
          DResetMap(map: DVar("mymap"), index: DVar("e"), value: DVar("e")),
        ])),
    DPrint(DSearch(
      iterator: DVar("mylist"),
      index: DInt(1),
    )),
  ]);
}
