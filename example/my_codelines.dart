import 'package:dpro/dpro.dart';

OCodeLines sampleIf() {
  return OCodeLines(
    codeLines: [
      ODefGive(
        target: OVar('a'),
        content: OInt(13),
        type: DTypes.dInt,
      ),
      OIf(
        condition: OBigger(OVar('a'), OInt(12)),
        lines: OCodeLines(codeLines: [
          OPrint(OString('月ではない')),
          OPrint(OString('月ではない')),
        ]),
        elseLines: OCodeLines(codeLines: [
          OPrint(OString('月です')),
          OPrint(OString('月です')),
        ]),
      ),
    ],
  );
}

OCodeLines testOperators() {
  return OCodeLines(codeLines: [
    ODefGive(
      target: OVar('a'),
      content: OTimes(OInt(2), OPlus(OPlus(OInt(2), OInt(3)), OInt(4))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar('a'),
      content: OMinus(OInt(3), OTimes(OInt(2), OInt(1))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar('a'),
      content: OTimes(OMinus(OInt(3), OInt(2)), OInt(1)),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar('a'),
      content: OTimes(OMinus(OInt(3), OInt(2)), OMinus(OInt(3), OInt(2))),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar('a'),
      content: OMinus(OMinus(OInt(4), OMinus(OInt(3), OInt(2))), OInt(1)),
      type: DTypes.dInt,
    ),
    ODefGive(
      target: OVar('a'),
      content: OAnd(OEqual(OBool(false), OBool(true)), OBool(true)),
      type: DTypes.dBool,
    ),
    ODefGive(
      target: OVar('a'),
      content: OEqual(OAnd(OBool(false), OBool(true)), OBool(true)),
      type: DTypes.dBool,
    ),
  ]);
}

OCodeLines sampleFor() {
  return OCodeLines(
    codeLines: [
      ODefGive(
        target: OVar('max'),
        content: OInt(100),
        type: DTypes.dInt,
      ),
      ODefGive(
        target: OVar('sum'),
        content: OInt(0),
        type: DTypes.dInt,
      ),
      // OForI(
      //   end: OVar('max'),
      //   lines: OCodeLines(codeLines: [
      //     OGive(
      //       target: OVar('sum'),
      //       content: OPlus(OVar('sum'), OVar('i')),
      //     ),
      //     OGive(
      //       target: OVar('sum'),
      //       content: OPlus(OVar('sum'), OVar('i')),
      //     ),
      //   ]),
      // ),
      OPrint(OVar('sum'))
    ],
  );
}

OCodeLines foreachList() {
  return OCodeLines(codeLines: [
    // OForE(
    //     type: DTypes.dStr,
    //     list: OList(
    //         valueType: DTypes.dStr,
    //         values: [OString('a'), OString('b'), OString('c'), OString('d')]),
    //     lines: OCodeLines(codeLines: [
    //       OPrint(OVar('e')),
    //     ]))
  ]);
}

OCodeLines listToMap() {
  return OCodeLines(codeLines: [
    ODefGive(
      target: OVar('mylist'),
      content: OList(valueType: DTypes.dStr, values: [
        OString('零'),
        OString('壱'),
        OString('弐'),
      ]),
    ),
    ODefGive(
      target: OVar('mymap'),
      content: OMap(
        keyType: DTypes.dStr,
        valueType: DTypes.dStr,
        map: {},
      ),
    ),
    // OForE(
    //     type: DTypes.dStr,
    //     list: OVar('mylist'),
    //     lines: OCodeLines(codeLines: [
    //       // OReplace(index: OVar('e'), value: OVar('e'), iterator: OVar('mymap')),
    //     ])),
    // OPrint(
    //   OSearch(
    //     iterator: OVar("mylist"),
    //     index: OInt(1),
    //   ),
    // ),
  ]);
}
