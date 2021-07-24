## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| surname            | string | null: false              |
| first_name         | string | null: false              |
| surname_reading    | string | null: false              |
| first_name_reading | string | null: false              |
| date_of_birth      |  date  | null: false              |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| price              | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| user               | references | foreign_key: true              |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references |  foreign_key: true             |
| user               | references |  foreign_key: true             |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_num          | string     | null: false                    |
| building_name      | string     |                                |
| telephone_num      | string     | null: false                    |
|       buy          | references | foreign_key: true              |

### Association

- belongs_to :buy