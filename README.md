# データベース設計

## usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|encrypted_password|string|null, false|

### アソシエーション
- has_many: articles
- has_many: orders
- has_many: comments



## articlesテーブル
|Colum|Type|Options|
|-----|----|-------|
|title|string|null: false|
|text|text|null: false|

### アソシエーション
- belongs_to: user
- has_one: order
- has_many: comments



## ordersテーブル
|Colum|Type|Options|
|-----|----|-------|
|article_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### アソシエーション
- belongs_to :article
- belongs_to :user
- has_one :address



## addressesテーブル
|Colum|Type|Options|
|-----|----|-------|
|postal_code|string|null :false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|string|null: false|
|order_id|integer|null: false, foreign_key: true|

### アソシエーション
- belongs_to :order



## commentsテーブル
|Colum|Type|Options|
|-----|----|-------|
|user_id|integer|null: false, foreign_key: true|
|aritcle_id|integer|null: false, foreign_key: true|
|text|text||

### アソシエーション
- belongs_to :user
- belongs_to :article