# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| email       | string | null: false |
| password    | string | null: false |
| user        | string | null: false |
| profile     | text   | null: false |

### Association

- has_many :fashions 
- has_many :comments

## fashions テーブル

| Column     | Type          | Options                        |
| ---------- | ------------- | ------------------------------ |
| artist     | string        | null: false                    |
| brand      | text          | null: false                    |
| item       | text          | null: false                    |
| user       | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| fashion   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :fashion
