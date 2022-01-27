import 'package:dpro/core/func/value/iterator/dlenght.dart';
import 'package:dpro/dpro.dart';

OCodeLines listToMapFunc() {
  return OCodeLines(
    objects: [
      OFunc(
        type: DTypes.dMap,
        name: "listToMap",
        lines: funcLines(),
        paras: OParams(params: [
          OPara(
              type: DType(DTypeStrs.dList, generics: [DTypes.dStr]),
              name: "myList"),
        ]),
      ),
    ],
  );
}

OCodeLines funcLines() {
  return OCodeLines(
    objects: [
      ODefGive(
          target: OVar("myMap"),
          content: OMap(
            keyType: DTypes.dInt,
            valueType: DTypes.dStr,
            map: {},
          )),
      OForI(
        end: OLenght(iterator: OVar("myList")),
        lines: OCodeLines(
          objects: [
            OGive(
                target: OVar("myMap"),
                content: OSearch(
                  iterator: OVar("myList"),
                  index: OVar("i"),
                )),
          ],
        ),
      ),
      OReturn(value: OVar("myMap")),
    ],
  );
}
