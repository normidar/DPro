import 'package:dpro/dpro.dart';

void main(List<String> arguments) {
  engineTest();
}

void engineTest() {
  TranEngine.tip = LanguageTips.java;
  print(TranEngine.tran(
    codes: OCodeLines(objects: [
      ODefGive(
        target: OVar("a"),
        content: OTimes(OInt(2), OPlus(OPlus(OInt(2), OInt(3)), OInt(4))),
      ),
      ODefGive(
        target: OVar("a"),
        content: OMinus(OInt(3), OTimes(OInt(2), OInt(1))),
      ),
      ODefGive(
        target: OVar("a"),
        content: OTimes(OMinus(OInt(3), OInt(2)), OInt(1)),
      ),
      ODefGive(
        target: OVar("a"),
        content: OTimes(OMinus(OInt(3), OInt(2)), OMinus(OInt(3), OInt(2))),
      ),
      ODefGive(
        target: OVar("a"),
        content: OMinus(OMinus(OInt(4), OMinus(OInt(3), OInt(2))), OInt(1)),
      ),
      ODefGive(
        target: OVar("a"),
        content: OAnd(OEqual(OBool(false), OBool(true)), OBool(true)),
      ),
      ODefGive(
        target: OVar("a"),
        content: OEqual(OAnd(OBool(false), OBool(true)), OBool(true)),
      ),
      ODefGive(
        target: OVar("a"),
        content: OBiggerEq(OInt(7), OInt(6)),
      ),
      ODefGive(
        target: OVar("a"),
        content: OBiggerEq(OPlus(OInt(3), OInt(4)), OInt(6)),
      ),
      ODefGive(
        target: OVar("a"),
        content: OUnequal(OPlus(OInt(3), OInt(4)), OInt(6)),
      ),
    ]),
  ));
}


// void engineTest() {
//   TranEngine.tip = LanguageTips.java;
//   print(TranEngine.tran(
//     codes: OCodeLines(objects: [
//       ODefGive(
//         target: OVar("a"),
//         content: OTimes(OInt(2), OPlus(OPlus(OInt(2), OInt(3)), OInt(4))),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OMinus(OInt(3), OTimes(OInt(2), OInt(1))),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OTimes(OMinus(OInt(3), OInt(2)), OInt(1)),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OTimes(OMinus(OInt(3), OInt(2)), OMinus(OInt(3), OInt(2))),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OMinus(OMinus(OInt(4), OMinus(OInt(3), OInt(2))), OInt(1)),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OAnd(OEqual(OBool(false), OBool(true)), OBool(true)),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OEqual(OAnd(OBool(false), OBool(true)), OBool(true)),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OBiggerEq(OInt(7), OInt(6)),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OBiggerEq(OPlus(OInt(3), OInt(4)), OInt(6)),
//       ),
//       ODefGive(
//         target: OVar("a"),
//         content: OUnequal(OPlus(OInt(3), OInt(4)), OInt(6)),
//       ),
//     ]),
//   ));
// }
