# README

# アプリケーション名
SalMatch（サルマッチ）

# 概要
フットサルのメンバーや対戦チームの募集ができます。他にも環境やレベルを選択して募集内容を見ることもできます。

# URL
https://sal-match.herokuapp.com/

# テスト用アカウント
投稿者
ニックネーム：イチロー
アドレス：aaa@icloud.com
パスワード:11111111

閲覧者
ニックネーム：ジロー
アドレス：bbb@icloud.com
パスワード：22222222

Basic認証
ID：user1
パスワード：1111

# 利用方法
ログインしなくてもトップページの投稿内容と詳細ページを閲覧することは可能です。

ユーザー登録機能：ブラウザ右上にある新規登録ボタンかログインボタンからログインして、フォームを入力して、登録ボタンを押す。

投稿機能：ブラウザ右上にある投稿ボタンを押して、フォームを入力して、登録ボタンを押す。

コメント機能：詳細ページのコメントフォームにコメントを入力して、送信ボタンを押す。

# 制作背景
フットサルはサッカーと同じで、ボールひとつあれば楽しめる競技です。同時にシューズも必要となってきますが、シューズはフィールドの環境に応じて種類が異なります。そのため、様々な環境でフットサルを楽しむには、環境ごとに対応しているシューズが必要となるため、持っているシューズに応じて環境が左右されてしまいます。私もフットサルをやっていて、フットサルのマッチングアプリを使ったことがあります。あるときアプリを見て、会場に行くと天然芝であると思っていたのに、実際は人工芝で人工芝用のシューズがなく参加できないことがありました。私が利用したアプリにはフィールドの環境が書いてませんでした。フットサルのアプリに環境が書いていないと、私と同じように苦い思いをする人がいるのではないかと思いました。フィールドの環境がわかりやすく明記されていれば、この問題を解決できるのではないかと考え、このアプリを作成しました。

# 洗い出し要件
AWS
目的：AWSのS3に画像を保存するため。
詳細：画像の保存はAWS S3で行うことで、デプロイや再起動しても画像がリンク切れにならないようにすることができる。
ストーリー：表示されている画像がAWS保存されている。
見積もり:12時間

コメント機能
目的：コメントでユーザー同士がコミュニケーションが取れるようにするため。
詳細：詳細ページからコメントを書くことができる。
ストーリー：詳細ページからコメントを書くことができる。
見積もり:12時間

ユーザー管理機能
目的：ユーザー管理を行うため。
詳細：新規登録、ログイン、ログアウトができる。
ストーリー：トップページ右上にある新規登録ボタンやログインボタンから、アプリにログインできる。
見積もり:12時間

投稿機能
目的：募集ページを投稿するため。
詳細：募集ページを投稿できる。
ストーリー：ログインすることで、トップページ右上に投稿ボタンが出現し、フォームを入力して投稿ボタンを押すことで、投稿できる。
見積もり:12時間

# 実装予定の内容
AWS

# テーブル設計
usersテーブル

| Column     | Type    | Options      |
| ---------- | ------- | ------------ |
| nickname   | string  | null: false  |
| email      | string  | null: false  |
| password   | string  | null: false  |
| first_name | string  | null: false  |
| second_name| string  | null: false  |
| first_kana | string  | null: false  |
| second_kana| string  | null: false  |
| birthday   | date    | null: false  |

Association

- has_many :tweets
- has_many :comments

tweetsテーブル

| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| title           | string      | null: false                   |
| place           | string      | null: false                   |
| address         | string      | null: false                   |
| price           | string      | null: false                   |
| item            | string      | null: false                   |
| category_id     | integer     | null: false                   |
| field_id        | integer     | null: false                   |
| level_id        | integer     | null: false                   |
| month_id        | integer     | null: false                   |
| day_id          | integer     | null: false                   |
| hour_id         | integer     | null: false                   |
| user            | references  | null: false, foreign_key:true |

Association

- has_many :comments
- belongs_to :user

commentsテーブル

| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| text            | text        | null: false                   |
| user            | references  | null: false, foreign_key:true |
| tweet           | references  | null: false, foreign_key:true |

Association

- belongs_to :user
- belongs_to :tweet

# ローカルでの動作方法
ターミナルに以下のコードを上から順に入力する。
cd projects
git clone https://github.com/Taisei-Noguchi/sal-match.git
cd sal-match
bundle install
yarn install
rails db:create
rails db:migrate