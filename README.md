# テーブル設計

## usersテーブル


|nickname              |string       |null: false              |
|email                 |string       |null: false, unique: true|
|encrypted_password    |string       |null: false              |
|last_name             |string       |null: false              |
|first_name            |string       |null: false              |
|last_name_kana        |string       |null: false              |
|first_name_kana       |string       |null: false              |
|date_of_birth         |date         |null: false              |



### Association
has_many :items

## itemsテーブル


|product_name          |string       |null: false                   |
|descritption          |text         |null: false                   |
|product_description   |integer      |null: false                   |
|category_id           |integer      |null: false                   |
|product_condition_id  |integer      |null: false                   |
|shipping_costs_id     |integer      |null: false                   |
|region_of_origin_id   |integer      |null: false                   |
|condition_id          |integer      |null: false                   |
|delivery_time         |integer      |null: false                   |
|prefecture_id         |integer      |null: false                   |
|user                  |references   |null: false, foreign_key: true|
|sales_price           |integer      |null: false                   |



### Association
belongs_to :order


## ordersテーブル
|item                  |references   |null: false, foreign_key: true|
|user                  |integer      |null: false                   |

###Association
belongs_to :users


## addressesテーブル


|post_code             |string       |null: false                   |
|prefecture_id         |integer      |null: false                   |
|street_address        |string       |null: false                   |
|building_name         |string       |                              |
|telephone_number      |string       |                              |

### Association
belongs_to :order