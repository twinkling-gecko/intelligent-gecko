---
marp: true
theme: moja-gecko
---

<!-- _class: cover -->
# Go 勉強会 2

## echoで作るwebサーバ

---

# GoのWeb FW

* あんまりデファクトがない
* gin
* beego
* martini
* revel
* **echo**
...

---

## そもそもFWいらなくない？派

* goは組み込みのnet/httpが優秀
* これベースに愚直にやってけばそれでいいじゃん
* FWの習得コストが無駄じゃん

## やっぱFWは欲しい派

* リクエストをバラしてちまちまパースするのがつらい
* メソッドによってルーティング先変えたりとかしんどい
* ミドルウェアの仕組みを作るのがダルい


**=> echoでいいじゃん**

---

# echo

* goのminimalなweb FW
* パフォーマンスが高め
* expressとかflaskとかsinatraみたいなminimalさ
  * RevelやRailsとは反対に居る存在
* 言葉としてはVCモデルって感じ？

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
HTTPのリクエストの受け口を作ってハンドラに引き渡してる
