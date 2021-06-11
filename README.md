## users テーブル
| Column               | Type    |  Option                   |
| -------------------- | ------- | ------------------------  |
| email                | string  |  unique:true, null: false |
| encrypted_password   | string  |  null: false              |
| last_name            | string  |  null: false              |
| first_name           | string  |  null: false              | 
| last_name_kana       | string  |  null: false              |
| first_name_kana      | string  |  null: false              |
| nickname             | string  |  null: false              |
| birthday             | date    |  null: false              |

has_many :items
has_many :comments
has_many :histories

## items テーブル
| Column          | Type       |  Option                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    | 
| product_price   | integer    | null: false                    |    
| category_id     | integer    | null: false                    | 
| address_id      | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_id      | integer    | null: false                    |
| deliver_days_id | integer    | null: false                    |
| explain         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

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
belongs_to    :user


## orders テーブル
| Column                 | Type       |  Option                       |
| -------------------    | ---------- | ----------------------------- |
| history                | references | null: false foreign_key: true |
| delivery_postalcode    | string     | null: false                   |
| delivery_city          | string     | null: false                   |
| delivery_state         | string     | null: false                   |
| delivery_phone         | string     | null: false                   |
| delivery_building_id   | string     | null: false                   |
| delivery_country_id    | integer    | null: false                   |

belongs_to :history