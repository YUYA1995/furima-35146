## users テーブル
| Column     | Type    |  Option     |
| ---------- | ------- | ----------- |
| email      | string  |  NOT NULL   |
| password   | string  |  NOT NULL   |
| name       | string  |  NOT NULL   |
| nickname   | string  |  NOT NULL   |
| birthday   | string  |  NOT NULL   |

has_many :items
has_many :comments

## items テーブル
| Column     | Type       |  Option   |
| ---------- | ---------- | --------  |
| title      | string     | NOT NULL  | 
| price      | text       | NOT NULL  |
| category   | text       | NOY NULL  | 
| user       | references |           |

belongs_to :user
has_many   :comments

## 購入者 テーブル
| Column     | Type       |  Option  |
| ---------- | ---------- | -------- |
| text       | text       | NOT NULL |

belongs_to :user
belongs_to
