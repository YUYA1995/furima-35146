## users テーブル
| Column               | Type    |  Option                  |
| -------------------- | ------- | ------------------------ |
| email                | string  |  unique:true nill: false |
| encrypted_password   | string  |  null: false             |
| last_name            | string  |  null: false             |
| first_name           | string  |  null: false             |
| last_name(kana)      | string  |  null: false             |
| first_name(kana)     | string  |  null: false             |
| nickname             | string  |  null: false             |
| birthday             | date    |  null: false             |

has_many :items
has_many :comments
has_many :histories

## items テーブル
| Column        | Type       |  Option                        |
| ----------    | ---------- | ------------------------------ |
| title         | string     | null: false                    | 
| product_price | integer    | null: false                    |    
| category      | integer    | null: false                    | 
| address       | integer    | null: false                    |
| condition     | integer    | null: false                    |
| postage       | integer    | null: false                    |
| explain_id    | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
belongs_to :user
has_many   :comments
has_one    :histories

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
| user       | references | null: false, foreign_key: true |

has_one    :item
has_one    :orders


## orders テーブル
| Column              | Type       |  Option     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false |
| delivery_postalcode | string     | null: false |
| delivery_city       | string     | null: false |
| delivery_state      | string     | null: false |
| delivery_country    | string     | null: false |
| delivery_phone      | string     | null: false |
| card_number         | string     | null: false |
| card_issuedmonth    | string     | null: false |
| card_issuedyear     | string     | null: false |
| card_cvc            | string     | null: false |

belongs_to :histories