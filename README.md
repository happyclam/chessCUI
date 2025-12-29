# Carefree Chess

[お気楽チェスアプリ](https://happyclam.booth.pm/items/6399553)のGUI部分を除いたソースファイルです。  

### 関連記事
* [「お気楽チェス」アプリリリースしました](https://happyclam.github.io/project/2019-11-16/chessapp)
* [チェスだけに必要な局面評価属性](https://happyclam.github.io/software/2020-02-11/evaluatechess)
* [チェスAIとテスト駆動開発](https://happyclam.github.io/software/2024-04-07/tdd)
* [チェスのStalemateとPINの話](https://happyclam.github.io/software/2024-12-15/chessPIN)
* [PINされたステイルメイト](https://happyclam.github.io/software/2025-12-30/pin_induced_stalemate)

# 環境
```
$ node -v
v18.20.3
```
# JavaScript生成環境
※ 「package.jsonファイル」参照
```
$ npm install
```

# AI同士の対戦
　Ubuntuのターミナル上で固定幅フォントを使って実行している限りは問題起きてませんが、Unicode駒を使ってますので環境によっては表示がズレるかもしれません。  
　CUI版には千日手（Threefold Repetition）回避のロジックが無いので千日手になるケースが多いです。
```
$ coffee game.coffee
:
:
--- 千日手 ---
52
経過時間: 323184ミリ秒
```

# テストスクリプト実行時間計測
※「.mocharc.jsonファイル」参照

* 全テスト実行

```
$ NODE_OPTIONS="--max-old-space-size=24576" mocha --require coffeescript/register --require test/setup.coffee "test/**/*.coffee"
:
:
Total duration: 6015.75 sec

  234 passing (2h)
```
* ファイル単位で実行

```
$ NODE_OPTIONS="--max-old-space-size=24576" mocha --require coffeescript/register --require test/setup.coffee "test/pawn.coffee"
:
:
Total duration: 0.10 sec

  40 passing (104ms)
```

* テスト単位で実行

```
$ NODE_OPTIONS="--max-old-space-size=24576" mocha --require coffeescript/register --require test/setup.coffee -g "stalemate_105-2" "test/tactical.coffee"
:
:
Total duration: 6.86 sec

  1 passing (7s)
```


