[![badge](https://github.com/normidar/dpro/actions/workflows/dart.yml/badge.svg?branch=main)](https://github.com/normidar/DPro/actions)       [![pub package](https://img.shields.io/pub/v/dpro.svg)](https://pub.dev/packages/dpro)


# DPro

[English](https://github.com/normidar/DPro)|[Japanese](https://github.com/normidar/DPro/blob/main/README-ja.md)

## what is DPro?

DPro is a auto programing langrage transfrom tool.

## How to use it?

```
// choose the programing langrage
  TranEngine.tip = LanguageTips.java;
  print(TranEngine.tran(
    codes: cli.sampleFor(),
  ));
// prepare logic Objects
  CodeLines sampleFor() {
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

// output java code:
for (String e : new ArrayList<String>(Arrays.asList("a", "b", "c", "d"))) {
  Log.d("log",e);
}
```

## スポンサー

[![twitter](https://raw.githubusercontent.com/normidar/svgs/main/twitter.svg)](https://twitter.com/itpharmacy1212?ref_src=twsrc%5Etfw)

## how would we create the engine from zero

- lines
- types
- def
- def give
- give
- const value
 - const list
 - const map
- list.get
- map.get
- var
- ouput(print)
- calculate
- if
- else
- fori
- fori_simply
- fore
- while
- func
- class
- extend


TODO:
- export to json and import with json
- let it can run code objects!
- modules!
- UI designer!


Future Support Languages:
- Object Oriented
    - Type Script
    - Java
    - Python
    - Swift
    - Dart
    - C#
    - GoLang
- Only Runable
    - C
    - machine language
- Functional
    - Haskell
    - OCaml
    - F#
