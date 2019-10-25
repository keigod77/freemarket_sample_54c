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
| birthday_year | integer | null :false |
| birthday_month | integer | null :false |
| birthday_day | integer | null :false |
| phone_number | string | unique |
| email | string | null :false, unique |
| password | string | null :false |
| evaluation | references |foreign_key: true, dependent: :destroy|
### Assoiation
- has_many :items
- has_many :cards
- has_many :comments
- has_many :goods
- has_many :adresseses
- has_many :evaluations
- has_many :sns_credentials dependent: :destroy

## sns_credentials
| Column | Type | Options |
| ------ | ---- | ------- |
| uid | string | null :false |
| provider | string | null :false |
| user | references | foreign_key: true |
### Association
- belongs_to :user


## addressesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| prefectures | string | null :false |
| city | string | null :false |
| address | string | null :false |
| building | string ||
| postal_code | string | null :false |
| users | references | foreign_key: true |
### Assoiation
- belong_to :user

## evaluationsテーブル
| good_evaluation | integer ||
| normal_evaluation | integer ||
| bad_evaluation | integer ||
### Assosiation
- belongs_to :user



## itemsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null :false |
| name | string | null :false |
| description | text | null :false |
| category | references | null :false |
| brand | references | null :false |
| size | references | foreign_key: true |
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
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- has_many :goods
- has_many :comments
- has_many :images

## imagesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| image | text | null :false |
| item | references | null :false, foreign_key: true |
### Assoiation
- belongs_to :item

## goodsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| like | integer ||
| user | references | foreign_key: true |
| item | references | foreign_key: true |
### Assoiation
- belongs_to :item
- belongs_to :user


## sizesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| size | string | null :false |
### Assoiation
- has_many :items


## cardsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null :false |
| customer_id | string | null :false |
| security_code | integer | null :false |
| expiration_date_month | integer | null :false |
| expiration_date_year | integer | null :false |
### Assoiation
- belongs_to :user


## categorysテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| name | string | null: false|
| parent_id | integer ||
||||
### Assoiation
- has_many :items
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id


## brandsテーブル
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