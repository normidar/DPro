import 'package:dpro/dpro.dart';

void main(List<String> arguments) {
  // engineTest();
  print(['1', '2'].map((e) => int.parse(e)) is List);
}

// to test the class object
void engineTest() {
  final codes = OCodeLines<DStatement>(
    codeLines: [
      ODefGive(target: OVar('a'), content: OFloat(3)),
      ODefGive(target: OVar('b'), content: OInt(4)),
      OPrint(OPlus(OVar('a'), OVar('b'))),
    ],
  );
  final engine = RunEngine();
  engine.run(codes);
}

// /// to test the class object
// void engineTest() {
//   TranEngine.tip = LanguageTips.java;
//   print(TranEngine.tran(
//     codes: OCodeLines(objects: [
//       OClass(
//           name: "Abc",
//           fieldMembers: OCodeLines(objects: [
//             OField(type: DTypes.dInt, isPrivate: true, name: "id"),
//             OField(type: DTypes.dInt, name: "id2"),
//           ]),
//           methodMembers: OCodeLines(objects: [
//             OMethod(
//                 name: "abc",
//                 arguments: [
//                   OArgument(type: DTypes.dStr, name: "arg1"),
//                   OArgument(type: DTypes.dStr, name: "arg2"),
//                 ],
//                 lines: OCodeLines(
//                   objects: [
//                     ODefGive(
//                       target: OVar("a"),
//                       content: OTimes(
//                           OInt(2), OPlus(OPlus(OInt(2), OInt(3)), OInt(4))),
//                     ),
//                   ],
//                 ))
//           ])),
//     ]),
//   ));
// }

/// to test the operator
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
