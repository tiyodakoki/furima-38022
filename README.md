#テーブル設計
## users テーブル
| Column             | Type     | Option                    |
| -------            | ------   |  ------                   |
| nickname           | string   | null:false                |
| email              | string   | null:false,  unique: true |
| encrypted_password | string   | null:false                |
| first_name         | string   | null:false                |
| last_name          | string   | null:false                |
| birth              | date     | null:false                | 
| first_name_kana    | string   | null:false                |
| last_name_kana     | string   | null:false                |

### association
- has_many :buyers
- has_many :items

## buyersテーブル
| Colmn    | Type       | Option               |
| ------   | -----      | ------               |
| item     | references | foreign_key: true    |
| user     | references | foreign_key: true    |



### association

- belongs_to :user
- belongs_to :item
- has_one :address



## addressテーブル

| Column         | Type       | Option                        |
| -----          | ----       |  ------                       |
| post_code      | string     | null:false                    |
| region_id      | string     | null:false                    |
| manicipalities | string     | null:false                    |
| address        | string     | null: false                   | 
| building       | string     |                               | 
| phone_number   | string     | null: false                   |
| buyer          | references | null:false, foreign_key: true |

### association

- belongs_to :buyer

## items テーブル

| Column           | Type        | Option            |
| ------           | -----       | ------            |
| name             | string      | null: false       |
| infomation       | text        | null: false       |
| category_id      | integer     | null: false       |  
| condition_id     | integer     | null: false       | 
| postage_id       | integer     | null: false       | 
| region_id        | integer     | null: false       | 
| shipping_days_id | integer     | null: false       |
| price            | integer     | null:false        |
| user             | references  | foreign_key: true | 

## association

- has_one :buyer
- belongs_to :user