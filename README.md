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
has_many: orders

## itemsテーブル


|product_name          |string       |null: false                   |
|product_description   |text         |null: false                   |
|category_id           |string       |null: false                   |
|product_condition_id  |string       |null: false                   |
|shipping_costs_id     |string       |null: false                   |
|region_of_origin_id   |string       |null: false                   |
|condition_id          |string       |null: false                   |
|delivery_time         |string       |null: false                   |
|prefecture_id         |string       |null: false                   |
|user                  |references   |null: false, foreign_key: true|
|sales_price           |integer      |null: false                   |

#カラム数が余分


### Association
has_one :order
has_many: users

## ordersテーブル
|item                  |references   |null: false, foreign_key: true|
|user                  |references   |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item

## addressesテーブル


|post_code             |string       |null: false                   |
|prefecture_id         |integer      |null: false                   |
|municipalities        |string       |null: false                   |
|street_address        |string       |null: false                   |
|building_name         |string       |                              |
|telephone_number      |integer      |                              |
|order                 |references   |null: false, foreign_key: true|


### Association
belongs_to :order