## usersテーブル

| Column      | Type    | Options     |
| ------------| --------| ------------|
| email       | string  | null: false |
| password    | string  | null: false |  
| nickname    | string  | null: false |
| family_name | string  | null: false | 
| last_name   | string  | null: false |
| birthday    | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :credit_cards
- has_one :shipping_address

# itemsテーブル

| Column          | Type       | Options     |
| ----------------| -----------| ------------|
| item_name       | string     | null: false |
| item_text       | text       | null: false |
| category        | integer    | null: false |
| image           |            |             |
| status          | integr     | null: false |
| delivery_charge | integer    | null: false |
| ship_from       | integer    | null: false |
| shipping_days   | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column       | Type       | Options     |
| -------------| -----------| ------------|
| comment_text | text       | null: false |
| user         | references |             |
| item         | references |             |

### Association

- belongs_to :user
- belongs_to :prototype

## credit_cardsテーブル

| Column          | Type       | Options     |
| ----------------| -----------| ------------|
| card_number     | integer    | null: false |
| expiration_date | integer    | null: false |  
| security_code   | integer    | null: false |
| user            | references |             |

### Association

- belongs_to :user

## shipping_addressテーブル

| Column          | Type       | Options     |
| ----------------| -----------| ------------|
| postal_code     | integer    | null: false |
| prefectures     | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | integer    | null: false |
| user            | references |             |

### Association
- belongs_to :user
