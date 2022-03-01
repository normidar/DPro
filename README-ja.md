[![badge](https://github.com/normidar/dpro/actions/workflows/dart.yml/badge.svg?branch=main)](https://github.com/normidar/DPro/actions)       [![pub package](https://img.shields.io/pub/v/dpro.svg)](https://pub.dev/packages/dpro)


# DPro

[English](https://github.com/normidar/DPro)|[Japanese](https://github.com/normidar/DPro/blob/main/README-ja.md)

## DProとはなんですか？

DProロジックやアルゴリズムを **各プログラミング言語に転換するエンジン** です、
最終の目的はスクラッチみたいにdrag&dropでロジックやアルゴリズムを作成して、言語を選択してワンクリックで欲しい言語のコードに転換できるようにしたいです。

## 理念

> ロジックが先に存在する？それともコードが先に存在する？

答えはロジック先に頭に存在して、その後頭の中で習ったプログラミング言語に転換してコードを出す。

この場合以下の欠点があります：
- 習っていないプログラミング言語には転換できない
- 他人にアルゴリズムロジックを伝える時に不便が生じる（自分が習っている言語が他人のと違う）

という観点からこれを作りました。

## 使い方(開発中なので変化するかもしれません)

```
// ロジックと出力したい言語を選んでアウトプット
  TranEngine.tip = LanguageTips.java;
  print(TranEngine.tran(
    codes: cli.sampleFor(),
  ));
// 手書きのロジック
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


// 出力(Java)
int max = 100;
int sum = 0;
for (int i = 0;i < max;i += 1) {
  sum = sum + i;
  sum = sum + i;
}
Log.d("log",sum);
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
- リストの長さを獲得
