### イベント作成
![AVAssetExportPreset1920x1080 3 MOV](https://user-images.githubusercontent.com/70948169/118108690-42a29500-b41b-11eb-913b-7982d25f929f.gif)


# どんなアプリか
* サッカー好きな人が集まってスポーツバーで観戦できるサイトです。
* サッカー観戦イベントの作成、またイベント参加を気軽にできます。
* イベント作成時はイベント会場の地図を設定することができます。
<br>

# 誰のため
* 大人数でサッカー観戦したい人
* 家で一人でサッカー観戦している人
* サッカー観戦を通じて人との繋がりを持ちたい人
* スタジムに行けない人
<br>

# 機能一覧
* ユーザー登録、ログイン機能(devise)

* イベント投稿機能
  * 画像投稿(carrierwave)
 
  * 位置情報検索機能(geocoder)

* いいね機能(Ajax)
 
* コメント機能(Ajax)
 
* イベント参加機能(Ajax)
 
* いいね、コメント通知機能
 
* イベント検索機能(ransack)
 
* ページネーション機能(kaminari)
 
* サッカー順位表、スケジュール表示機能(football-data.org API)
<br>

# テスト
* Rspec
  * 単体テスト(model)
  * 機能テスト(request)
  * 結合テスト(system)
* Rubocop(静的解析)
<br>
<br>

# 使用技術

* Ruby 2.5.3
* Ruby on rails 5.2.4.4
* Mysql 5.7
* NGINX
* Puma
* unicorn
* AWS
  * VPC
  * EC2
  * RDS
  * ALB
  * ACM
  * Route 53
  * S3
* Docker 19.03.8
* Docker-compose 1.25.5
* CircleCi 2.0
* Rspec 3.10
* Rubocop
* Google Map API
* football-data.org API 
<br>


# インフラ構成図

![Untitled Diagram (5)](https://user-images.githubusercontent.com/70948169/117803902-19a2c880-b292-11eb-8021-0c95dbe18276.png)

<br>
<br>

# ER図

![Database ER diagram (crow's foot) (2)](https://user-images.githubusercontent.com/70948169/117804107-55d62900-b292-11eb-9ea6-853d0d2fe293.png)

