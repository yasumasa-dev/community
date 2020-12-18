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

## users テーブル
| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many :events
- has_many :comments
- has_many :join


## events テーブル
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| date        | date       | null: false                    |
| explanation | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| location_id | integer    | null: false                    |
| category-id | integer    | null: false                    |

### Association
- belongs_to :user
- has_many   :comments
- has_many   :join


## join テーブル
| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| event        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :event


## comments テーブル
| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| comment | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| event   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :event