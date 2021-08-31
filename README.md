# ギタフレ！

http://guitar-phrase.com/<br>
自分で弾いたギターフレーズを共有できるSNSです。<br>
アップロードされたギターフレーズにGood!やコメント、ユーザーに対してFav!することができます。<br>
フレーズやテーマにタグをつけることができ、ユーザーが好みの音楽を見つけやすいシステムになっています。<br>
<a href="http://guitar-phrase.com/">![guitarphrase](https://user-images.githubusercontent.com/85050692/131527042-c7031925-f458-459d-b2f9-39a3e59ff6d0.png)</a>
スマホからでも利用可能となっております。
<br><br>

# 使用技術
* Ruby 3.0.2
* Ruby on Rails 6.1.4
* MariaDB
* AWS
  * EC2
  * S3
  * Route53
* Nginx
* Unicorn
* TwitterAPI(ログイン認証)
* GoogleAPI(ログイン認証)

<br><br>
# 機能一覧
* メールアドレスを用いてのサインイン、ログイン
* TwitterやGoogleアカウントを用いてのサインイン、ログイン
* パスワードリセット（認証メールが送られます）
