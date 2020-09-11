---
marp: true
theme: moja-gecko
---

<!--- _class: cover -->

# アーキテクチャ勉強会

## Team: twinkling-gecko<br>Version: 1.1

---

# アーキテクチャってなんだよ (1/4)

- architecture: 建設術 建設様式 構造…
- IT 的には設計思想とか設計方式とかそんな感じ
  - システムアーキテクチャとかソフトウェアアーキテクチャとか色々
  - 例えばノイマン型・ノイマン型アーキテクチャとか
  - あと CPU アーキテクチャとか
    - x86・amd64・arm・MIPS…

---

# アーキテクチャってなんだよ (2/4)

![bg 35%](https://user-images.githubusercontent.com/38117745/86519864-f50fe000-be79-11ea-86f3-78f48d106ed0.png)

- こんなん
- システムの構成を
  表す表現

---

# アーキテクチャってなんだよ (3/4)

![bg 35%](https://user-images.githubusercontent.com/38117745/86589837-5b574880-bfc9-11ea-8fb8-140143fca6c1.png)

- 旭化成  
  エレクトロニクス  
  から引っ張ってきた

<!-- ちゃんと見るならhttp://www.aec.co.jp/solution/opto22/epic_iiotsys.html -->
<!-- やっぱり、システムの設計かなぁ -->

---

# アーキテクチャってなんだよ (4/4)

- ソフトウェアのアーキテクチャとしては一応  
  IEEE 1471 として標準があるらしい
- アーキテクチャ記述言語(モデリング言語)とかもある
  - SysML
  - AADL

<!-- システム設計書の書式を定めて、共通認識を得る -->
<!-- WFでは無いので、しっかりした設計書を出してとかはやんないけど -->
<!-- https://www.ogis-ri.co.jp/otc/hiroba/technical/SysML_AADL/SysML_AADL1/index.html -->

---

## ➔ これを踏まえて、今回のソリューションのアーキテクチャについて考えたい

---

# うちのアーキテクチャ (1/2)

![image](https://user-images.githubusercontent.com/38117745/86590887-7034db80-bfcb-11ea-8060-d77139fe6c72.png)

<!-- クラス用のプレゼンから引っ張ってきたやつだけど -->
<!-- 以降の話で使うので、確認してくれれば https://user-images.githubusercontent.com/38117745/86590887-7034db80-bfcb-11ea-8060-d77139fe6c72.png -->

---

# うちのアーキテクチャ (2/2)

主に以下 3 つで構成される

- センシングユニット
- ローカルハブ
- プラットフォーム

それぞれの部分について、共通認識を得ておきたい

<!-- 部品 と言ったけど、モジュールを目指しても良いかもしれない -->

---

# センシングユニット (1/5)

## センシングユニットとは…

- センサーとマイコンを組み合わせたもの
- センサーを使ってデータを収集し、BLE でローカルハブに送信する事が  
  仕事となる
  - センサーの種類によっては、AD コンバータとかも必要

---

# センシングユニット (2/5)

## センサー部分

- センサーとしては例えば
  - ロードセル
  - ドア開閉センサー
  - etc.

<!-- ロードセル+ADコンバータのセット https://www.amazon.co.jp/dp/B07JL7NP3F -->
<!-- 開閉センサーは多分0/1じゃないかな -->

---

# センシングユニット (3/5)

## マイコン部分

- マイコンとして例えば
  - ESP32 系列のボード
    - スイッチサイエンス ESPr Developer 32
    - M5 Stack シリーズ (Basic・ATOM Matrix・Lite 等)
    - 深圳のノーブランドの怪しいボードたち

---

# センシングユニット (4/5)

- その他 Bluetooth モジュールと適当なマイコンの組み合わせ
  - TI CC2541
  - Silicon Labs BLE112
  - Nordic 社のモジュール

<!-- まぁESP32系列で良さそうだけど一応ほかも -->
<!-- https://www.switch-science.com/catalog/3210/ -->
<!-- https://www.switch-science.com/catalog/3647/ -->
<!-- https://www.switch-science.com/catalog/6260/ -->
<!-- https://www.switch-science.com/catalog/6262/ -->
<!-- https://www.tij.co.jp/product/jp/CC2541 -->
<!-- https://jp.silabs.com/wireless/bluetooth/bluegiga-low-energy-legacy-modules/device.ble112 -->
<!-- 詳しくはマイコン勉強会の方でやります -->

---

# センシングユニット (5/5)

## ソフトウェア部分

- ino (Arduino IDE Sketch)
  - ESP32 の特徴として、Arduino の開発環境が使える
    - Arduino IDE に ESP32 用の拡張を入れることで対応可能
    - ライブラリとして ESP32 BLE Arduino とかも公開されている

---

# ローカルハブ (1/2)

## ローカルハブとは…

- Bluetooth(BLE)でセンシングユニットからデータを受け取って、
  プラットフォームに Ethernet なり Wi-Fi なり
  セルラー(携帯回線)なりでデータを送るのがメインの仕事

- あと、センシングユニットの設定もここが担う

- Bluetooth が動けば何でも良いといえば何でも良い
  - Bluetooth ドングルを挿したパソコンでも良いけど、
    サイズとコスト面で、Raspberry Pi とかが良さそう

<!-- 別にRasPiにこだわりはない -->

---

# ローカルハブ (2/2)

## ソフトウェア部分

- バックエンド部で BLE でデータを回収したり、プラットフォームに送ったり
- センサーの設定機能
  - 何でも良いけど、Go とか Rust とか…

---

# プラットフォーム (1/2)

## プラットフォームとは…

- サービスとして動き、各家庭のローカルハブからデータを吸い上げて収集する
- 今回はクラウド上に構築を想定している
- ローカルハブはここにデータを送信し、需要予測を行う企業等は
  ここからデータを取得する
- 更に、一般消費者向けの付加価値提供もここから行うことで、
  場所に関係無く通知を受信出来るようにする

---

# プラットフォーム (2/2)

## 技術面

- ホスティング場所としては AWS・GCP・Azure 系のクラウドだったり、
  オンプレのサーバーだったり
- バックエンドはやっぱり Go だったり Rust だったり
- あと、Web アプリのホスティングも Vue だったり Nuxt だったり

---

# あと、抜けていた点 (1/2)

- 一般消費者が使うフロントエンドアプリについて考えてなかった
- ここは共通認識を得ておきたい

## 一般消費者向けアプリで必要そうな部分

- 付加価値を受け取り、表示する機能
  (通知を受け取ったり、統計を確認したり)
- センサーの設定を行う機能
- これらを、デバイスを問わずに提供する

<!-- クラス向けプレゼンを作った時、この件を考慮していなかった -->

---

# あと、抜けていた点 (2/2)

## 一般消費者向けアプリのアーキテクチャ

- 選択肢としては
  - ネイティブのモバイルアプリ+PC ソフトウェア
  - Web アプリ

<!-- ネイティブでは無いと思うけど -->

---

<!-- _class: back-cover -->

# Just Do it!

![img1](https://i.imgur.com/aBdGj60.png)