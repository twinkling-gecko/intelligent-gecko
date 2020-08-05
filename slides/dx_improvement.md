---
marp: true
theme: moja-teal
---

<!-- _class: cover -->

# DX/PX 向上デー

マツコ・デラックス

---

# DX/PX とは

- **D**eveloper e**X**perience
  - 開発・保守する上での体験
- **P**rogramming **e**xperience
  - プログラミングする上での体験
- 厳密な定義はない、「これが俺の DX 向上だ」といえばそれが DX 向上
  - とはいえ「良いデスクを買う」とかはどうなんだろうか...
- 要は開発する時点でストレス溜まってたらまあそりゃ質のいいものはできないよねという話
- 良い体験は良い成果を生む、ミスも減るしアイディアもでる
- DX/PX 向上して快適に開発していきましょう

---

# DX/PX 向上の例

- 環境構築を Docker にして環境差に起因するトラブルを排除
- VSCode のワークスペース設定ファイルをリポジトリに含んで全員の設定を共通化
- テストコードちゃんと書いて簡単に品質チェック
- Linter/Formatter でコーディングスタイルを自動で統一
- pre-commit でコミット前の品質チェック
- CI/CD 導入して品質管理やデプロイを自動化
- エディタのよく使う機能をショートカット割当
- 便利なプラグインで作業効率化
- github から slack に通知を飛ばして進捗の可視化

など

---

# 実際に取り組んでいる例

## 🦎intellijent-gecko🦎

- github に push するだけでスライドをビルドして公開 ✨
- prettier で markdown を自動フォーマット ✨

## 🦎hungry-gecko🦎

- docker で開発環境を配布 ✨
- prettier, gofmt で自動フォーマット ✨
- eslint, gotest で 自動品質チェック ✨
- ↑ これらを pre-commit でも自動実行 ✨
- language-server-protocol で開発支援 ✨

---

# 今日のテーマ（ハンズオン）

- 自分のエディタを強化しよう
  - 見やすいカラースキームを設定しよう
  - language-server の支援が働くようにしよう
  - ショートカットで自動フォーマットしよう
  - 便利なスニペットを導入しよう
  - 有用な設定を共有しよう
  - 自慢のショートカットを共有しよう
  - 気に入ったプラグインを共有しよう

エンジニアにとってエディタは最も長い時間付き合う道具。
ここを妥協するかこだわるかで開発効率が大きく変わります。まずは足回りから。

---

# 見やすいカラースキームを設定しよう

- これは正直好み
- でも自分が「可読性が高い」と思うものにしましょう
- 「色がすき」とかもモチベに直結するので大事
- 探し方
  - [VSCode](https://marketplace.visualstudio.com/search?target=VSCode&category=Themes&sortBy=Installs) marketplace で theme とかで検索すると結構出る
  - [vim](http://vimcolors.com/) vimcolors が便利

---

# 私の VSCode

- [ayu](https://marketplace.visualstudio.com/items?itemName=teabyii.ayu) の mirage がすき

<div style="text-align: center">

![w:800](https://user-images.githubusercontent.com/34061817/89371118-64008300-d71d-11ea-8a6a-d4a694807664.png)

<div>

---

# 私の nvim

- 最近 [palenight](https://github.com/drewtempelmeyer/palenight.vim) が気に入った

<div style="text-align: center">

![w:800](https://user-images.githubusercontent.com/34061817/89371334-091b5b80-d71e-11ea-8667-5adebeebfb4b.png)

<div>

---

# language-server の支援が働くようにしよう

- language-server は VSCode に組み込まれてる補完周りの機能
  - 補完とかフォーマットとか参照元ジャンプとか
- プロトコルとして OSS で公開されているので、
  対応したクライアントがあれば大抵のエディタで使える
  - 私は nvim + [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) を使ってる
  - 前は LC-neovim と deoplete と neosnippet とでやってたけど管理ダルくなった
  - coc は補完周りから LSP の管理までやってくれるので楽
- VSCode では対応する拡張を入れるだけで大体うごく
  - 例えば [Go](https://marketplace.visualstudio.com/items?itemName=golang.Go) を入れると gopls によって golang の LSP 環境ができる

---

# LS 補完の動作の例

![bg 90%](https://user-images.githubusercontent.com/34061817/89371642-dd4ca580-d71e-11ea-9061-110aaef345f4.png)

![bg 80%](https://user-images.githubusercontent.com/34061817/89371799-564bfd00-d71f-11ea-8b17-8164b7a7219e.png)

---

# ショートカットで自動フォーマットしよう

- LSP の機能や Prettier などのフォーマッタで自動フォーマットできるとすごく楽
- ショートカット振って呼吸するようにフォーマットしていけ
- おすすめは Ctrl-F
