## users テーブル
| Column               | Type    |  Option       |
| -------------------- | ------- | ------------- |
| email                | string  |  unique:true  |
| encrypted_password   | string  |  null: false  |
| last_name            | string  |  null: false  |
| first_name           | string  |  null: false  |
| last_name(kana)      | string  |  null: false  |
| first_name(kana)     | string  |  null: false  |
| nickname             | string  |  null: false  |
| birthday             | date    |  null: false  |

has_many :items
has_many :comments

## items テーブル
| Column        | Type       |  Option                        |
| ----------    | ---------- | ------------------------------ |
| title         | string     | null: false                    | 
| product_price | integer    | null: false                    |    
| category      | text       | null: false                    | 
| address       | string     | null: false                    |
| condition     | string     | null: false                    |
| postage       | integer    | null: false                    |
| explanation   | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
belongs_to :user
has_many   :comments

## comments テーブル
| Column     | Type       |  Option    |
| ---------- | ---------- | --------   |
| text       | text       | null: false|

belongs_to :user
belongs_to :item

## histories テーブル
| Column     | Type       |  Option                        |
| ---------- | ---------- | --------                       |
| item       | references | null: false, foreign_key: true |

has_one :item


## orders テーブル
| Column              | Type       |  Option                        |
| ------------------- | ---------- | ------------------------------ |
| delivery_name       | string     | null: false, foreign_key: true |
| delivery_postalcode | string     | null: false, foreign_key: true |
| delivery_city       | string     | null: false, foreign_key: true |
| delivery_state      | string     | null: false, foreign_key: true |
| delivery_country    | string     | null: false, foreign_key: true |

has_one :histories