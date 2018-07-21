## morizyun.github.io
https://morizyun.github.io/ruby/design-pattern-index.html

## www.techscore.com
http://www.techscore.com/tech/DesignPattern/index.html/

## Iterator
- 要素の集まりを保有するオブジェクト(Listオブジェクト)の各要素に順番にアクセスする方法を提供するためのパターン
- 走査方法を提供するクラスの独立
  - 例) BlogIteratorクラスの作成

## Abstract Factory
- インスタンスの生成を専門に行うクラスを用意することで、整合性を必要とされる一連のオブジェクト群を間違いなく生成するためのパターン
- 例) 車の必要な部品

## Builder
- 同じ作成過程で異なる表現形式の結果を得るためのパターン
- 例) 家の建築を行う場合、以下2要素の決定が必要
  - 作成過程(Director)
    - 複数の作成過程の集合
  - 使用素材(Builder)
    - 各建築物ごとで使う素材の決定

## FactoryMethod
- インスタンスの生成をサブクラスに行わせることで、より柔軟に生成するインスタンスを選択することが可能となる

## Adapter
- インタフェースに互換性の無いクラス同士を組み合わせる
  - 継承または委譲を利用してインタフェースの差異を吸収する
