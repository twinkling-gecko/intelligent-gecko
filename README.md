# intelligent-gecko

## Description

- 勉強会資料をまとめておくリポジトリ
- marp テーマを利用可能
- ファイル保存時に自動でフォーマットされる

## Depends

- VSCode
- Node.js
- npm
- yarn

## Installation

### 1. GitHub トークンの取得

GitHub Packages から npm パッケージをインストールする為に必要な設定

1. [GitHub Personal Access Tokens](https://github.com/settings/tokens)にアクセスする

1. ページ右上の`Generate new token`をクリックする  
   ![image](https://user-images.githubusercontent.com/38117745/86754426-d6793700-c07b-11ea-8ca8-2346844984c0.png)

1. `Note`に適当な説明を入力する 管理画面での識別に使うだけなので、適当で OK  
   ![image](https://user-images.githubusercontent.com/38117745/87316660-071c0d80-c561-11ea-8462-a059dbbbe9d0.png)

1. `Select scopes`の`read:packages`にチェックを入れる  
   ![image](https://user-images.githubusercontent.com/38117745/86756159-25739c00-c07d-11ea-90bf-84d98bb2e460.png)

1. `Generate token`をクリックして、トークンを取得する  
   ![image](https://user-images.githubusercontent.com/38117745/86756311-42a86a80-c07d-11ea-9a63-4fcaebf151db.png)

1. 生成されたトークンをメモしておく  
   ![image](https://user-images.githubusercontent.com/38117745/86758200-a41d0900-c07e-11ea-9935-571c46c18bb5.png)

### 2. ~/.npmrc にトークンを設定する

ホームディレクトリ下の.npmrc に以下を追記して保存する

```
//npm.pkg.github.com/:_authToken=<GitHubトークン>
@scope:registry="https://npm.pkg.github.com"
```

- `<GitHub トークン>`部分を発行したトークンに置き換え
- Windows の場合は、`.npmrc` はユーザーフォルダ直下に存在 無ければ作成

```
//npm.pkg.github.com/:_authToken=hogefugapiyohogefugapiyohogefugapiyohoge
@scope:registry="https://npm.pkg.github.com"
```

- 例

### 3. npm パッケージをインストールする

```
cd intelligent-gecko
```

```
yarn install
```

## Usege

1. VSCode でこのリポジトリを開く

1. 右下に推奨拡張機能の通知が表示されるので、インストールする

1. Markdown ファイルを新規作成する

1. 以下をファイルの先頭に記述し、marp 記法で資料を作成

```
---
marp: true
theme: <テーマ名>
---
```

## Operation

1. `slides/`に`content_title.md`の形式で marp 記法の markdown を記述する
1. master に push すると自動的に`slides/`にある markdown がビルドされ、github pages にデプロイされる

- 基本的には master にそのまま commit で良いと思うが、万が一自分の担当ではないスライドを触る際は conflict に注意
- レンダリング済みのスライドは<https://twinkling-gecko.github.io/intelligent-gecko/>で閲覧可能

## themes

- moja-teal
- moja-simple
- moja-gecko
