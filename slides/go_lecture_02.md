---
marp: true
theme: moja-gecko
---

<style>
section.center {
  text-align: center;
}
</style>

<!-- _class: cover -->

# Go 勉強会 2

## echo で作る web サーバ

---

# Go の Web FW

- あんまりデファクトがない
- gin
- beego
- martini
- revel
- **echo**
  ...

---

## そもそも FW いらなくない？派

- go は組み込みの net/http が優秀
- これベースに愚直にやってけばそれでいいじゃん
- FW の習得コストが無駄じゃん

## やっぱ FW は欲しい派

- リクエストをバラしてちまちまパースするのがつらい
- メソッドによってルーティング先変えたりとかしんどい
- ミドルウェアの仕組みを作るのがダルい

**=> echo でいいじゃん**

---

# echo

- go の minimal な web FW
- パフォーマンスが高め
- express とか flask とか sinatra みたいな minimal さ
  - Revel や Rails とは反対に居る存在
- 言葉としては VC モデルって感じ？

---

# 今回の勉強会用リポジトリ

```
$ go get github.com/twinkling-gecko/echo-test-server
$ cd $GOPATH/src/github.com/twinkling-gecko/echo-test-server
```

```
.
├── README.md
├── go.mod
├── go.sum
├── main.go
└── pkg
    ├── handler
    │   └── hello.go
    └── router
        ├── hello.go
        └── init.go

3 directories, 7 files
```

---

## main.go

エントリポイント
サーバの起動とミドルウェアの読み込みを行ってる

## pkg/handler

リクエストを捌いてレスポンスを作る処理を行ってる

## pkg/router

HTTP のリクエストの受け口を作ってハンドラに引き渡してる

---

<!-- _class: center -->

# ライブコーディングします

![](https://imgc.appbank.net/c/wp-content/uploads/2017/02/morikubo2.jpg)
