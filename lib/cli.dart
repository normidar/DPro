// import 'package:cli/core/code_lines.dart';
// import 'package:cli/core/dtypes.dart';


// CodeLines sampleIf() {
//   return CodeLines(
//     objects: [
//       DefGive(
//         target: DVar("a"),
//         content: DInt(13),
//         type: "int",
//       ),
//       DIf(
//         condition: Calculate(
//           ">",
//           DVar("a"),
//           DInt(12),
//         ),
//         lines: CodeLines(objects: [
//           DPrint(DString("月ではない")),
//           DPrint(DString("月ではない")),
//         ]),
//         elseLines: CodeLines(objects: [
//           DPrint(DString("月です")),
//           DPrint(DString("月です")),
//         ]),
//       ),
//     ],
//   );
// }

// CodeLines sampleFor() {
//   return CodeLines(
//     objects: [
//       DefGive(
//         target: DVar("max"),
//         content: DInt(100),
//         type: "int",
//       ),
//       DefGive(
//         target: DVar("sum"),
//         content: DInt(0),
//         type: "int",
//       ),
//       DForI(
//         end: DInt(100),
//         lines: CodeLines(objects: [
//           Give(
//             target: DVar("sum"),
//             content: Calculate("+", DVar("sum"), DVar("i")),
//           ),
//           Give(
//             target: DVar("sum"),
//             content: Calculate("+", DVar("sum"), DVar("i")),
//           ),
//         ]),
//       ),
//       DPrint(DVar("sum"))
//     ],
//   );
// }

// CodeLines sampleFunc() {
//   return CodeLines(
//     objects: [
//       DFunc(
//         type: DTypes.dInt,
//         name: "test",
//         lines: sampleFor(),
//       ),
//     ],
//   );
// }

// CodeLines sampleClass() {
//   return CodeLines(objects: [
//     DClass(
//       name: "Dog",
//       lines: sampleFunc(),
//     )
//   ]);
// }

// CodeLines foreachList() {
//   return CodeLines(objects: [
//     DForE(
//         type: DTypes.dStr,
//         list: DList(
//             type: DTypes.dStr,
//             values: [DString("a"), DString("b"), DString("c"), DString("d")]),
//         lines: CodeLines(objects: [
//           DPrint(DVar("e")),
//         ]))
//   ]);
// }
