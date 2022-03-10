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
              content: OCalculate(
                left: OVar("rt"),
                cal: DCals.dTimes,
                right: OCalculate(
                    cal: DCals.dPlus, left: OVar("i"), right: OInt(1)),
              ),
            ),
          ],
        ),
      ),
      OReturn(value: OVar("rt")),
    ],
  );
}
