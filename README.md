# DPro

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
  return CodeLines(
    objects: [
      DefGive(
        target: DVar("max"),
        content: DInt(100),
        type: DTypes.dInt,
      ),
      DefGive(
        target: DVar("sum"),
        content: DInt(0),
        type: DTypes.dInt,
      ),
      DForI(
        end: DVar("max"),
        lines: CodeLines(objects: [
          Give(
            target: DVar("sum"),
            content: Calculate("+", DVar("sum"), DVar("i")),
          ),
          Give(
            target: DVar("sum"),
            content: Calculate("+", DVar("sum"), DVar("i")),
          ),
        ]),
      ),
      DPrint(DVar("sum"))
    ],
  );
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
