# ギタフレ！

http://guitar-phrase.com/<br>
自分で弾いたギターフレーズを共有できるSNSです。<br>
アップロードされたギターフレーズにGood!やコメント、ユーザーに対してFav!することができます。<br>
フレーズやテーマにタグをつけることができ、ユーザーが好みの音楽を見つけやすいシステムになっています。<br>
<a href="http://guitar-phrase.com/">![guitarphrase](https://user-images.githubusercontent.com/85050692/131527042-c7031925-f458-459d-b2f9-39a3e59ff6d0.png)</a>
スマホからでも利用可能となっております。<br>
TOPページの「ゲストログイン」からゲストユーザーとしてログイン可能です。是非ご利用下さい。
<br><br>

# 使用技術
* Ruby 3.0.2
* Ruby on Rails 6.1.4
  * Active Storage
  * Action Mailer
* MariaDB
* Ajax
* AWS
  * EC2
  * S3
  * Route53
* Nginx
* Unicorn
* TwitterAPI(ログイン認証)
* GoogleAPI(ログイン認証)

<br><br>

# 各種使用ツール
* Cacoo(サイトマップ、ER図、ワイヤーフレーム)
* GitHub

<br><br>

# 機能一覧
* メールアドレス、Twitter、Googleアカウントを用いてのサインイン、ログイン機能(devise)
* ユーザープロフィール画像設定機能、フレーズやテーマの音声ファイルアップロード機能(Active Storage)
* フレーズへのGoodやユーザーへのFavボタン(Ajax)
* フレーズ、テーマへのコメント(Ajax)
* フレーズ、テーマ、ユーザーの検索機能
* フレーズのFavユーザー限定公開機能
* 名前空間を利用した管理者権限(admin)機能
* ページネーション機能(Kaminari, ユーザーページではAjaxでの非同期ページネーションを採用)
* お問い合わせ機能(Action Mailer)

<br><br>

# 苦労した点
* Active Storageでのファイルアップロード機能や、非同期通信機能(Ajax)といったスクールで教わったこと以外の機能を実装する際はエラーの連続で苦労しました。<br>
エラーの内容を読み解き、Qiitaや個人ブログなどを参考にし、実装まで辿り着くことができました。
<br>

* スクールではherokuへのデプロイを教わったので、本アプリではAWSへのデプロイに挑戦してみました。<br>
EC2の設定や、Nginx、Unicornといったインフラ構成に戸惑いましたが、少しずつwebサーバーやRack等の役割を理解し、独自ドメインを設定できるようにまで至りました。<br>
もちろんまだまだ理解は浅いと思いますので、更に理解を深められるように日々精進していきたいと考えております。

<br><br>

# 改善点、課題
* RSpecを用いたテスト機能を活用する
* GitHubの理解、活用
  * 機能作成ごとにブランチを切って変更履歴を残す
  * Issueでのタスク管理
* deviseの設定についての理解
