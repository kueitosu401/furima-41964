# テーブル設計

## usersテーブル

|Column                |Type         |Options                  |
|nickname              |string       |null: false              |
|id                    |integer      |null: false              |
|email                 |string       |null: false, unique: true|
|encrypted_password    |string       |null: false              |
|last_name             |string       |null: false              |
|first_name            |string       |null: false              |
|last_name_kana        |string       |null: false              |
|first_name_kana       |string       |null: false              |
|date_of_birth         |date         |null: false              |

###Association
has_many :item


## itemsテーブル

|Column                |Type         |Options                       |
|name                  |string       |null: false                   |
|descritption          |text         |null: false                   |
|price                 |integer      |null: false                   |
|category_id           |integer      |null: false                   |
|shipping_charge_id    |integer      |null: false                   |
|condition_id          |integer      |null: false                   |
|prefecture_id         |integer      |null: false                   |
|user(FK)              |references   |null: false, foreign_key: true|
|id(PK)                |integer      |null: false                   |


###Association
belongs_to :user