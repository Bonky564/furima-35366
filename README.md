## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| nickname           | string | null: false |
| date of birth      | string | null: false |

### Association

- has_many :items
- has_many :

## item テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| state              | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belong_to :users
- has_one :buy


## buy テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| addresses          | references | null: false, foreign_key: true |

### Association

- belong_to :item
- has_many :addresses

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| house_num          | string     | null: false                    |
| building_name      | string     |                                |

### Association

- belong_to :buys