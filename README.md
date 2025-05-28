# テーブル設計

## usersテーブル


|nickname              |string       |null: false              |
|id                    |integer      |null: false              |
|email                 |string       |null: false, unique: true|
|encrypted_password    |string       |null: false              |
|last_name             |string       |null: false              |
|first_name            |string       |null: false              |
|last_name_kana        |string       |null: false              |
|first_name_kana       |string       |null: false              |
|date_of_birth         |date         |null: false              |

usersのアソシエーションにordersとのアソシエーションを追加しましょう。
has_manyの場合紐づくモデル名を複数形で記載しましょう。

###Association
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
|id                    |integer      |null: false                   |

カラム不足
itemsテーブルに必要なカラムが不足しています。
出品画面でプルダウンで選択する内容は５つです。Activehashのいずれかのカラムが不足しているようですね。

###Association
belongs_to :users


## ordersテーブル
|id                    |integer      |null: false                   |
|user                  |integer      |null: false                   |

###Association
belongs_to :users


## addressテーブル


|id                    |integer      |null: false                   |
|post_code             |string       |null: false                   |
|prefectures           |string       |null: false                   |
|street_address        |string       |null: false                   |
|building_name         |integer      |null: false                   |
|telephone_number      |string       |null: false                   |

###Association
belongs_to :users





＃プルダウンの項目の追加５つ