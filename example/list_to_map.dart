import 'package:dpro/dpro.dart';

OCodeLines listToMapFunc() {
  return OCodeLines(
    objects: [
      OFunc(
        type: DTypes.dMap,
        name: "listToMap",
        lines: funcLines(),
        paras: OParams(params: [
          OPara(type: DTypes.dList, name: "myList"),
        ]),
      ),
    ],
  );
}

OCodeLines funcLines() {
  return OCodeLines(
    objects: [],
  );
}
