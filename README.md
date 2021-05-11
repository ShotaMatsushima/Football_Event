どんなアプリか
サッカー好きが集まってスポーツバーで観戦できるサイトです。
サッカー観戦イベントの作成、またイベント参加を気軽にできます。
イベント作成時はイベント会場の地図を設定することができます。

誰のため
・大人数でサッカー観戦したい人
・家で一人でサッカー観戦している人
・サッカー観戦を通じて人との繋がりを持ちたい人
・スタジムに行けない人

使用技術

開発環境
・Ruby 2.5.3
Ruby on rails 5.2.4.4
・Mysql 5.7
・NGINX
Puma
unicorn
AWS
 VPC
 EC2
 RDS
 ALB
 ACM
 Route 53
 S3
Docker 19.03.8
Docker-compose 1.25.5
CircleCi 2.0
Rspec 3.10
Rubocop
Google Map API
football-data.org API 

機能一覧

・ユーザー登録、　ログイン機能(devise)

イベント投稿機能
画像(carrierwave)
イベント会場の位置情報検索機能(geocoder)

 いいね機能(Ajax)
 
 コメント機能(Ajax)
 
 イベント参加機能(Ajax)
 
 いいね、コメント通知機能
 
 イベント検索機能(ransack)
 
 ページネーション機能(kaminari)
 
 サッカー順位表、スケジュール表示機能(football-data.org API)

テスト
Rspec
 単体テスト(model)
 機能テスト(request)
 結合テスト(system)
 
Rubocop(静的解析)
