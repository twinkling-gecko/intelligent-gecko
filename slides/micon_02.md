---
marp: true
theme: moja-gecko
---

<!--- _class: cover -->

# マイコン勉強会 2 Arduino 編

## Team: twinkling-gecko<br>Version: 1.0

---

# この会の目標

- マイコンの入門として広く知られる Arduino についての基礎を共有
- マイコン界隈の雰囲気に慣れる

---

# 全体の流れ

- Arduino について
- 開発環境と非 Arduino 系統のボードについて
- 便利そうなライブラリについて

---

# Hello, Arduino

- 読み

  - アルドゥイーノとか
  - アルデュイーノとか
  - アルディーノとか

- オープンソースのハードウェア + Arduino IDE のシステム
  - 文字通りのハードの設計図が公開されていて、色んなメーカーが
    互換機を出してたりする

![image](https://user-images.githubusercontent.com/38117745/87306579-2f047480-c553-11ea-9552-d607f168fe0f.png)

---

# Hello, Arduino

- Atmel 社の AVR 等(一部例外あり)を中心に、USB や I/O ピン等のインタフェースを 1 枚のボードに収めている
  - ラズパイがシングルボードコンピュータに属するのと同様に、ワンボードマイコンのジャンルに属する
  - ラズパイが SoC として Broadcom の BCM シリーズを載せている様に、こちらは AVR に RAM・ROM・EEPROM・クロック等を収めている

<!--
余談:SoCとマイクロコントローラの違いってなんだろうね
多くのSoCはメモリを取り込んでないとか 後者は歴史的にSoCとは呼べないとか見たけど
-->

---

# Hello, Arduino

- 搭載している AVR マイコンやサイズやインタフェースの違いで色々と種類がある

  - Arduino Uno
  - Arduino Leonardo
  - Arduino Pro Mini
  - etc.

- 更に、互換品が色々
  - Arduino Leonardo の小型互換品 Pro micro
    - HiLetgo 製
    - SparkFun 製
      - SparkFun 製の互換品のスイッチサイエンス製

---

# Arduino IDE

- Arduino 系ボード用の統合開発環境
- C/C++ベースの Arduino 用プログラムのエディタを備え、ビルド、アップロードを行ってくれる
- ESP32 等の別のマイコンへ対応させる拡張機能も存在する

![bg right 110%](https://upload.wikimedia.org/wikipedia/commons/a/a1/Arduino_IDE_-_Blink.png)

<!-- 紛らわしいけどここのマイコンはマイクロコントローラ -->

---

# CLI を使った開発

## arduino-cli

- Arduino 公式のコマンドラインツール
- Arduino IDE の機能をコマンドラインから利用可能
- ARM 版が存在し、Raspberry Pi で開発が行える

## ino

- コマンドライン上で Arduino スケッチ(.ino ファイル)をビルド、
  アップロードすることの出来るソフトウェア
- プロジェクトの init、ソースコードのボード向けビルド、
  ボードへのアップロード、シリアル通信のモニター等が可能

---

# Arduino 系以外のボードでの開発

## ESP32

- Arduino IDE で ESP32 の開発が行える Arduino core for the ESP32 を利用可能
- `WiFi.h`を include の上で利用可能
- Wi-Fi でネットワークに参加し、HTTP サーバーを走らせる
  サンプルスケッチが同梱されている

## M5Stack

- Arduino IDE で開発するための M5Stack 公式のライブラリが存在する

<!-- http://mukujii.sakura.ne.jp/esp1.html -->
<!-- https://github.com/espressif/arduino-esp32 -->
<!-- 特定のベンダーに深入りはしない -->

---

# 便利そうなライブラリ

## Serial

- シリアル通信を行う

## Keyboard

- USB キーボードとしてキーコードを送信する

## Mouse

- USB マウスとしてマウス操作を送信できる

---

# 便利そうなライブラリ

## EEPROM

- 不揮発性メモリに対するデータの読み込みや書き込みを行う

## SoftwareSerial

- シリアル通信を行う
- ハードウェアで実装されている機能をソフトウェアで複製したもの らしい

## Wire

- 2 線インタフェースである I2C や TWI をサポートする

---

# 便利そうなライブラリ

## SPI

- SPI バスに接続されたデバイスとの通信を行う

## NintendoSwitchController

- Arduino Leonardo を Nintendo Switch の Joy-Con として振る舞わせる

![image](https://user-images.githubusercontent.com/38117745/87307274-3d9f5b80-c554-11ea-9119-5928b778afdc.png)

<!-- レビューにいい感じに描いてあったので貼り付けておく -->

---

<!-- _class: back-cover -->

# Just Do it!

![image](https://user-images.githubusercontent.com/38117745/87259156-2d4f9800-c4e4-11ea-9b34-a60a593bffe8.png)
