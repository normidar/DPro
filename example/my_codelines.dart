import 'package:dpro/dpro.dart';

OCodeLines sampleIf() {
  return OCodeLines(
    objects: [
      ODefGive(
        target: OVar("a"),
        content: OInt(13),
        type: DTypes.dInt,
      ),
      OIf(
        condition: OBigger(OVar("a"), OInt(12)),
        lines: OCodeLines(objects: [
          OPrint(OString("月ではない")),
          OPrint(OString("月ではない")),
        ]),
        elseLines: OCodeLines(objects: [
          OPrint(OString("月です")),
          OPrint(OString("月です")),
        ]),
      ),
    ],
  );
}

OCodeLines testOperators() {
  return OCodeLines(objects: [
    ODefGive(
      target: OVar("a"),
      content: OTimes(OInt(2), OPlus(OPlus(OInt(2), OInt(3)), OInt(4))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar("a"),
      content: OMinus(OInt(3), OTimes(OInt(2), OInt(1))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar("a"),
      content: OTimes(OMinus(OInt(3), OInt(2)), OInt(1)),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar("a"),
      content: OTimes(OMinus(OInt(3), OInt(2)), OMinus(OInt(3), OInt(2))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar("a"),
      content: OMinus(OMinus(OInt(4), OMinus(OInt(3), OInt(2))), OInt(1)),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar("a"),
      content: OPower(OInt(3), OPower(OInt(2), OInt(1))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar("a"),
      content: OPower(OPower(OInt(3), OInt(2)), OInt(1)),
      type: DTypes.dInt,
    ),
  ]);
}

OCodeLines sampleFor() {
  return OCodeLines(
    objects: [
      ODefGive(
        target: OVar("max"),
        content: OInt(100),
        type: DTypes.dInt,
      ),
      ODefGive(
        target: OVar("sum"),
        content: OInt(0),
        type: DTypes.dInt,
      ),
      OForI(
        end: OVar("max"),
        lines: OCodeLines(objects: [
          OGive(
            target: OVar("sum"),
            content: OPlus(OVar("sum"), OVar("i")),
          ),
          OGive(
            target: OVar("sum"),
            content: OPlus(OVar("sum"), OVar("i")),
          ),
        ]),
      ),
      OPrint(OVar("sum"))
    ],
  );
}

OCodeLines sampleFunc() {
  return OCodeLines(
    objects: [
      OFunc(
        type: DTypes.dInt,
        name: "test",
        lines: sampleFor(),
        paras: OParams(params: [
          OPara(type: DTypes.dStr, name: "param1"),
          OPara(type: DTypes.dStr, name: "param2"),
        ]),
      ),
    ],
  );
}

OCodeLines sampleClass() {
  return OCodeLines(objects: [
    OClass(
      name: "Oog",
      lines: sampleFunc(),
    )
  ]);
}

OCodeLines foreachList() {
  return OCodeLines(objects: [
    OForE(
        type: DTypes.dStr,
        list: OList(
            valueType: DTypes.dStr,
            values: [OString("a"), OString("b"), OString("c"), OString("d")]),
        lines: OCodeLines(objects: [
          OPrint(OVar("e")),
        ]))
  ]);
}

OCodeLines listToMap() {
  return OCodeLines(objects: [
    ODefGive(
      target: OVar("mylist"),
      content: OList(valueType: DTypes.dStr, values: [
        OString("零"),
        OString("壱"),
        OString("弐"),
      ]),
    ),
    ODefGive(
      target: OVar("mymap"),
      content: OMap(
        keyType: DTypes.dStr,
        valueType: DTypes.dStr,
        map: {},
      ),
    ),
    OForE(
        type: DTypes.dStr,
        list: OVar("mylist"),
        lines: OCodeLines(objects: [
          OReplace(index: OVar("e"), value: OVar("e"), iterator: OVar("mymap")),
        ])),
    OPrint(OSearch(
      iterator: OVar("mylist"),
      index: OInt(1),
    )),
  ]);
}
