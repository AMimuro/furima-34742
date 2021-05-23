# README
## usersテーブル

| Column             | Type    | Options                  |
| -------------------| --------| -------------------------|
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |  
| nickname           | string  | null: false              |
| family_name        | string  | null: false              | 
| first_name          | string  | null: false              |
| family_name_kana   | string  | null: false              | 
| first_name_kana     | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

# itemsテーブル

| Column             | Type       | Options                        |
| -------------------| -----------| -------------------------------|
| item_name          | string     | null: false                    |
| item_text          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer     | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| ship_from_id       | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## commentsテーブル

| Column       | Type       | Options     |
| -------------| -----------| ------------|
| comment_text | text       | null: false |
| user         | references |             |
| item         | references |             |

### Association

- belongs_to :user
- belongs_to :item

## receiversテーブル

| Column          | Type       | Options                        |
| ----------------| -----------| -------------------------------|
| postal_code     | string     | null: false                    |
| ship_from_id    | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase


## purchasesテーブル

| Column | Type       | Options                        |
| -------| -----------| -------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :receiver

