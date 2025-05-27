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


## ordersテーブル
|Column                |Type         |Options                       |
|id(PK)                |integer      |null: false                   |
|Card number           |integer      |null: false                   |
|date of expiry        |integer      |null: false                   |
|Security Code         |integer      |null: false                   |




## addressテーブル

|Column                |Type         |Options                       |
|id(PK)                |integer      |null: false                   |
|post code             |string       |null: false                   |
|prefectures           |Type         |null: false                   |
|street address        |string       |null: false                   |
|Building Name         |string       |null: false                   |
|telephone number      |integer      |null: false                   |



・住所テーブル
見本アプリの購入画面を参考に書いてください
・購入テーブル
「だれが」「何を」購入したのかを保存するテーブル

