import 'package:dpro/core/func/value/iterator/dlenght.dart';
import 'package:dpro/dpro.dart';

OCodeLines calculateFactorial() {
  return OCodeLines(
    objects: [
      OFunc(
        type: DTypes.dInt,
        name: "calculateFactorial",
        lines: funcLines(),
        paras: OParams(params: [
          OPara(type: DTypes.dInt, name: "inp"),
        ]),
      ),
    ],
  );
}

OCodeLines funcLines() {
  return OCodeLines(
    objects: [
      ODefGive(target: OVar("rt"), content: OInt(1)),
      OForI(
        end: OVar("inp"),
        lines: OCodeLines(
          objects: [
            OGive(
              target: OVar("rt"),
              content: OCalculate(calStr, left, right),
            ),
          ],
        ),
      ),
      OReturn(value: OVar("myMap")),
    ],
  );
}
