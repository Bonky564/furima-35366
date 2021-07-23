## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| nickname           | string | null: false |
| surname            | string | null: false |
| first_name         | string | null: false |
| surname_reading    | string | null: false |
| first_name_reading | string | null: false |
| date of birth      |  date  | null: false |

### Association

- has_many :items
- has_many :buys

## item テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| state              | string     | null: false                    |
| price              | integer     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buy テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :addresses

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_num          | string     | null: false                    |
| building_name      | string     |                                |
| telephone_num      | string     | null: false                    |
|       buy          | references | null: false, foreign_key: true |

### Association

- belongs_to :buy