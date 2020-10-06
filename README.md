# README


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
| price           | string      | null: false                   |
| detail          | string      | null: false                   |
| category        | integer     | null: false                   |
| prefecture_id   | integer     | null: false                   |
| field_id        | integer     | null: false                   |
| level_id        | integer     | null: false                   |
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

belongs_to :user
belongs_to :tweet