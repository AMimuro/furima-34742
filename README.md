## usersテーブル

| Column      | Type    | Options  |
| ------------| --------| ---------|
| email       | string  | NOT NULL |
| password    | string  | NOT NULL |
| nickname    | string  | NOT NULL |
| family_name | string  | NOT NULL |
| last_name   | string  | NOT NULL |
| birthday    | integer | NOT NULL |

### Association

- has_many :items
- has_many :comments
- has_one :credit_cards
- has_one :shipping_address

# itemsテーブル

| Column          | Type       | Options  |
| ----------------| -----------| ---------|
| item_name       | string     | NOT NULL |
| item_text       | text       | NOT NULL |
| category        | text       | NOT NULL |
| image           |            |          |
| status          | text       | NOT NULL |
| delivery_charge | integer    | NOT NULL |
| ship_from       | text       | NOT NULL |
| shipping_days   | text       | NOT NULL |
| price           | integer    | NOT NULL |
| user            | references | NOT NULL |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column       | Type       | Options  |
| -------------| -----------| ---------|
| comment_text | text       | NOT NULL |
| user         | references |          |
| item         | references |          |

### Association

- belongs_to :user
- belongs_to :prototype

## credit_cardsテーブル

| Column          | Type       | Options  |
| ----------------| -----------| ---------|
| card_number     | integer    | NOT NULL |
| expiration_date | integer    |          |  
| security_code   | integer    |          |
| user            | references |          |

### Association

- belongs_to :user

## shipping_addressテーブル

| Column          | Type       | Options  |
| ----------------| -----------| ---------|
| postal_code     | integer    | NOT NULL |
| prefectures     |            | NOT NULL |
| city            | string     | NOT NULL |
| address         | string     | NOT NULL |
| building_name   |            |          |
| phone_number    |  integer   | NOT NULL |
| user            | references |          |

### Association
- belongs_to :user
