# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|postcode|varchar|null: false|
|prefecture_id|integer|null: false|    table
|city|varchar|null: false|
|block|integer|null: false|
|building|integer|null: false|
|phone_number|varchar|null: false, unique: true|
|email|varchar|null: false, unique: true|
|password|varchar|null: false|
|credit_card_number|varchar|null: false|    table
|credit_card_exp_date|date|null: false|
|credit_card_security_code|varchar|null: false|
|point|integer|null: false|
|point_exp_date|date|null: false|
|biography|varchar|null: false|
|user_image_id|varchar|null: false|    table

### Association
- has_many :items
- has_many :transactions

---------------------------------------------------------

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|category|varchar|null: false, index: true|    table
|brand|varchar|null: false, index: true|    table
|item_name|varchar|null: false, index: true|
|user_id|integer|null: false, foreign_key: true|
|state|varchar|null: false|
|delivery_fee_payer|varchar|null: false|
|shipping_method|varchar|null: false|
|shipping_source_area|varchar|null: false|
|estimated_shipping_date|date|null: false|
|price|integer|null: false|
|comment|varchar|null: false|
|item_image_id|varchar|null: false|    table
|trade_status|integer|null: false|

### Association
- belongs_to :user
- has_one :trade

---------------------------------------------------------

## tradeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id_seller|integer|null: false, foreign_key: true|
|user_id_buyer|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|price|integer|null: false, foreign_key: true|
|delivery_fee|integer|null: false|    table
|trade_status|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :item
