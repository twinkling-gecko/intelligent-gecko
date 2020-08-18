---
marp: true
theme: moja-simple
---

<style>
img {
  display: block;
  margin: auto;
}
</style>

<!-- _class: cover -->

# 2020-08 進捗報告 MTG

## twinkling-gecko

上村健太　　小林稜太
鈴木颯太　　篠原　彰

---

# 進捗

![bg right 70%](https://user-images.githubusercontent.com/34061817/88744753-38acef80-d183-11ea-88a5-5b4b4f8f1230.png)

- モノが来ねえ
- 日報文化
- 勉強 LT 会
- ライブコーディング
- DX/PX 向上デー
- ハンズオン会
  - brave-gecko
  - hungry-gecko

---

# モノが来ねえ

- 弊チームはハードウェアがないとプロトタイピングも始められないので
  - Arduino
  - ロードセル
  - Raspberry Pi
- やることないなった
- 暇なので勉強会をしている

---

# 成果物について

## twinkling-gecko（きらめきヤモリ）

- Github の organization
- 弊チームのリポジトリは基本的に Public なので誰でも見れます
- https://github.com/twinkling-gecko

# プロジェクト管理について

- スクラム周りは Jira Software
- Slack に Jira, Github からの通知を飛ばして進捗を可視化
- レトロスペクティブは Trello で KPT

---

# 日報文化

![bg right](https://user-images.githubusercontent.com/34061817/89443622-7d401880-d78b-11ea-9bdb-74bb4fe1eb7f.png)

- デイリースクラムでの報告に課題を感じた
- 個々人のその日の作業進捗を記録する
- 成果に出ない進捗を可視化するのが目的
- 課題の認識、フォローを行える文化づくり
  - ⚠ スクラムはチームで解決する手法
- 自タスクを整理して振り返りの効果もある

---

# 勉強 LT 会

## intellijent-gecko（かしこいヤモリ）

現時点で過去 11 回開催

- Github: https://github.com/twinkling-gecko/intelligent-gecko
- 卒業制作で取り扱う技術について、各自テーマを割り振り知見収集を行う
- 得た知見を元に資料を作成し LT で他メンバに共有する
- **もともと知識を持っていたか**を考慮せずにテーマを振っている
  - 知識がないメンバが自発的に知識を得ることが目的
  - チームメンバの知識レベルを極力均等に均すことも目的
- CI/CD で markdown を自動ビルドして Github Pages にデプロイしている
- https://twinkling-gecko.github.io/intelligent-gecko/

---

# intellijent-gecko 構成図

(このスライドもそう)

![bg](https://user-images.githubusercontent.com/34061817/88746241-0ef5c780-d187-11ea-95b9-30eeb67d3bd5.png)

---

# ライブコーディング

- golang での開発の雰囲気、ノウハウを篠原が画面共有して雑談しながらコーディング
  - 実装の基本, パッケージング, ユニットテストの書き方, テクニック集など

![w:800](https://user-images.githubusercontent.com/34061817/88747155-3057b300-d189-11ea-85ba-5b7b83c3529a.png)

---

# DX/PX 向上デー

- https://twinkling-gecko.github.io/intelligent-gecko/dx_improvement.html
- 試験的にやってみた施策
- 実装技術に関することではなく、開発する上での Experience を向上することに費やす日
  - 1/sprint とか 1/week とかで定例的にやっていきたい
- CI/CD 整備
- test や style check の自動化
- エディタの設定やプラグインの知見の共有
- その他開発効率を高める知見の共有 など

---

# ハンズオン

product: brave-gecko, hungry-gecko

- 卒業制作とは直接関係のないアプリ開発を通して開発経験を得る
- 実際にアプリを開発することで、「やってみないとわからん」系の知見を得る
- ネタは卒制とは異なるが、技術要素は本番を意識
- 試運転の側面もあり
  - 構築した開発環境が問題ないか
  - 開発フローやタスクの回し方、運用ルールの下地づくり

---

<style>
img#brave {
  position: fixed;
  right: 20px;
  bottom: 20px;
}
</style>

# ハンズオン: brave-gecko（勇敢ヤモリ）

golang で実装した Discord bot

- https://github.com/twinkling-gecko/brave-gecko
- golang の基本的な開発について経験を得ることが目的
- go での構造体や関数定義、パッケージングに慣れる
- 構造化を意識して実装する
  - Discord からのイベント発火を待ち受けるリスナ
  - 投稿をパースしてコマンドを解釈するコマンドルーター
  - ルーティングされたコマンドを処理するハンドラ
- Discord でサノバウィッチの因幡めぐるさんがしゃべる
- 今は heroku 自動デプロイされるようにしてある

<img id="brave" src="https://user-images.githubusercontent.com/34061817/88748130-377fc080-d18b-11ea-8b23-d497763bd3cf.png">

---

# ハンズオン: hungry-gecko（腹ぺこヤモリ）

- https://github.com/twinkling-gecko/hungry-gecko
- 本番と構成を寄せた Web アプリケーション
- Nuxt.js による CDN 配信可能な SPA のフロントエンド
- Go で構築したロードバランシング可能な API サーバ
  - swagger でドキュメントの自動生成
- nginx のリバースプロキシ
- docker による上記サービスの管理
- CI/CD での品質管理・自動デプロイ
  - TBD: デプロイ先
    （GCP が一番無料クレジット扱いやすいので GKE になりそう）

---

# hungry-gecko 構成図

(本番に近い構成)

![bg](https://user-images.githubusercontent.com/34061817/88752395-c47b4780-d194-11ea-9040-51ecc91dc645.png)

---

<!-- _class: hero -->

<style>
section.hero, section.hero h1 {
  color: white;
  text-shadow:
    0px 0px 3px black,
    0px 0px 3px black,
    0px 0px 3px black,
    0px 0px 3px black,
    0px 0px 3px black,
    0px 0px 3px black,
    0px 0px 3px black,
    0px 0px 3px black;
}
</style>

# 今後

モノが来るまではネタを探してハンズオンを続けます...

![bg](https://user-images.githubusercontent.com/34061817/89409465-10ae2500-d75d-11ea-8e78-92e27661d24b.png)
