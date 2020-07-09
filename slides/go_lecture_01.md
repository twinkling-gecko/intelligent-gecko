---
marp: true
theme: moja-teal
---

<!-- _class: cover -->

# Go 勉強会 01

## go a long way toward

### 前提条件

ver.11 以降の Go が動作環境があること
よさげな Go が書けるエディタがあること
github のアカウントを持っていること

---

# Go のルール（これだけ抑えておけ）

- すべてを `$GOPATH` 以下で管理すべし
  - Go11 以降はどこでも良くなったけどこの外に置くのはあんまおすすめしない...
- `$GOPATH/src/github.com/ユーザ名/プロジェクト名` にソースコードをおくべし
  - gitBuckets とか gitLab とかまあ適当に読み替えて
- gofmt を信じろ（信じろ）

---

# \$GOPATH

- Go の特別な環境変数
- Go 関連のものはすべてこの PATH 以下で管理する
- \*nix 系 OS なら未定義の場合 `~/go` になったと思う
  - 私は\$HOME 直下が散らかるのきらいなので `~/.go` にしてる
- ついでに `$GOPATH/bin` に PATH 通しとくと良いよ
- ~/.bashrc とかに書いとけ

```bash
export GOPATH=~/go # 例
```

---

# GO のプロジェクト準備

## 2 秒でわかる！Go のプロジェクト初期化講座

1. `$GOPATH/github.com/ユーザ名/プロジェクト名` でディレクトリ切る
1. `$ go mod init` で依存関係の初期化
1. エントリポイントを作る 拡張子は`.go`
1. 実行は `$ go run FILENAME` ビルドは `$ go build`

<div style="text-align: center;">

終
製作・著作
\------------
ＮＨＫ

</div>

---

# Just do it!

Don’t let your dreams be dreams. Yesterday you said tomorrow. So just do it!

1. ディレクトリを切る

```bash
# goではこのsrcから先の部分がまるまるパッケージ名になる
$ mkdir $GOPATH/src/github.com/ユーザ名/hello-go-world
$ cd $GOPATH/src/github.com/ユーザ名/hello-go-world
```

2. `$ go mod init` する

```bash
$ go mod init
$ ls
# なんかファイルが増えてる
```

---

# Do it!

And you’re not going to stop there No, what are you waiting for?

3. エントリポイント `main.go` を作る

書けオラァ！

```go
package main

import "fmt"

func main() {
    fmt.Println("You can do it.")
}
```

---

# Yes you can

While you’re gonna wake up and work hard at it. Nothing is impossible.

- Go のプログラムは**必ずどこかの package に属する**
  - **エントリポイントは「main パッケージの main 関数」である必要がある**
  - java で言う psvm
- import でパッケージを読み込んでいる
- Go では**public なメンバはすべて大文字で始まる**ので、 `fmt.Println` を呼んでいる

---

# Stop giving up

4. 実行する

```
$ go run main.go
You can do it!
```

5. gofmt かけてみる

- go 公式のフォーマッタ コーディングスタイルはこれに従え

```bash
$ gofmt -w main.go
```

- これで勝手にコーディングスタイルを修正してくれる

---

# パッケージを分割する

- Go ではパッケージとフォルダ名が一致してる必要はない
  - でも一致しといたほうが管理しやすいと思うけど...
- とりあえず今回は pkg パッケージを定義する

1. `pkg` ディレクトリを切る
2. `pkg/greet.go` を作る
3. 書けオラァ！

```go
package pkg

func Greet(target string) string {
  return "Hello, " + target + "!"
}
```

---

# main を書き直す

書けオラァ！

```go
package main

import (
  "fmt"

  // ここは自分のパッケージ名に合わせる
  "github.com/s10akir/hello-go-world/pkg"
)

func main() {
    fmt.Println(pkg.Greet("World"))
}
```

import は組み込み => 外部ライブラリ => 独自パッケージ みたいにまとめて書く慣習がある

---

# 動けオラァ！

```bash
$ go run main.go
Hello, World!
```

![w:600](https://www.ryukakusan.co.jp/assets/img/lp/nometane/img_slide-01.png)

---

# テスト

- go のテストは `ファイル名_test.go` で同じ場所に定義する
- テストに使える `testing` ライブラリがある

`pkg/greet_test.go`

```go
package pkg

import "testing"

// Greetが正しく値を返すことをテストする
func TestGreetMessage(test *testing.T) {
    message := Greet("Planet")

    // 出力が想定と違ったらテスト失敗
    if message != "Hello, Planet!" {
        test.Fatal("Failed...")
    }
}
```

---

# テストの実行

```bash
$ go test
ok      github.com/s10akir/hello-world/pkg      0.248s
```

## わざと失敗させてみる（テストケースを書き換える）

```
$ go test
--- FAIL: TestGreetMessage (0.00s)
    greet_test.go:11: Failed...
FAIL
exit status 1
FAIL    github.com/s10akir/hello-world/pkg      0.441s
```

gg

---

# 参考になるプロジェクト

- [golang/go](https://github.com/golang/go)
  Go そのもののリポジトリ
  結構パッケージの中身が肥大化しててすごいが、
  Google がこれをヨシとしてるってことはんー、別にいいんじゃないですかね だって（適当）

- [golang-standards/project-layout](https://github.com/golang-standards/project-layout)
  オフィシャルではないがそこそこ著名なプロジェクト構成例
  歴史的経緯に基づく

- [あなたの Go アプリ/ライブラリのパッケージ構成もっとシンプルでよくない？](https://future-architect.github.io/articles/20200528/)

---

![bg](https://www.tv-asahi.co.jp/douga/images/program/507/large/a04e35b07cfb3ab43de8d826d737f466.jpg)
