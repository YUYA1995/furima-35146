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
| category_id   | integer    | null: false                    | 
| address_id    | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| postage_id    | integer    | null: false                    |
| explain_id    | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
belongs_to :user
has_many   :comments
has_one    :history

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

belongs_to    :item
has_one       :order
has_one       :user


## orders テーブル
| Column                 | Type       |  Option     |
| -------------------    | ---------- | ----------- |
| history                | references | null: false |
| delivery_postalcode_id | integer    | null: false |
| delivery_city_id       | integer    | null: false |
| delivery_state_id      | integer    | null: false |
| delivery_country_id    | integer    | null: false |
| delivery_phone_id      | integer    | null: false |

belongs_to :history