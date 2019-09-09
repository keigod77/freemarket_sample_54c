# README

# DB設計
## usersテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| icon | text ||
| self-introduction | text ||
| nickname | string | null :false |
| first_name | string | null :false |
| last_name | string | null :false |
| first_name_kana | string | null :false |
| last_name_kana | string | null :false |
| postal_code | string | null :false |
| last_name_kana | string | null :false |
| birthday | integer | null :false |
| prefectures | string | null :false |
| city | string | null :false |
| address | string | null :false |
| building | string ||
| phone_number | string ||
| email | string | null :false, unique |
| password | string | null :false |
| my_good_evaluation | integer ||
| my_normal_evaluation | integer ||
| my_bad_evaluation | integer ||
### Assoiation
- has_many :items
- has_many :card
- has_many :comments
- has_many :goods


## itemsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | reference | null :false |
| image | string | null :false |
| name | string | null :false |
| description | text | null :false |
| category | reference | null :false |
| bland | reference | null :false |
| size | reference | foreign_key: true |
| state | string | null :false |
| shipping_charge | string | null :false |
| delivery_method | string | null :false |
| region | string | null :false |
| days_to_delivery | string | null :false |
| price | integer | null :false |
| seller_id | integer | null :false |
| buyer_id | integer | null :false |


### Assoiation
- belongs_to :user
- belongs_to :bland
- belongs_to :size
- has_many :goods
- has_many :comments
- has_many :category


## goodsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| like | integer ||
| user | reference | foreign_key: true |
| item | reference | foreign_key: true |
### Assoiation
- belongs_to :items
- belongs_to :users


## sizesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| size | string | null :false |
### Assoiation
- has_many :items


## cardsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | reference | null :false |
| customer_id | string | null :false |
| card_id | string | null :false |

### Assoiation
- belongs_to :user


## categorysテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| name | string | null: false|
| parent_id | integer ||
### Assoiation
- belongs_to :item
- belongs_to :parent, class_name: :Category
- has_many :childlen, class_name: :Category, foreign_key: :parent_id


## blandsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| name | string | null: false|
### Assoiation
- has_many :items


## commentsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| comment | text | null: false |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |
### Assoiation
- belongs_to :user
- belongs_to :item