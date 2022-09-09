#テーブル設計
## users テーブル
| Column              | Type     | Option                   |
| -------            | ------   |  ------                   |
| nickname           | string   | null:false, unique: true  |
| email              | string   | null:false                |
| encrypted_password | string   | null:false                |
| first_name         | string   | null:false                |
| last_name          | string   | null:false                |
| birth              | integer  |  null:false               | 
### association
- has_many :buyers
- has_many :items

## buyerテーブル
| Colmn    | Type       | Option               |
| ------   | -----         | ------            |
| buy_item | references | foreign_key: true    |
| buyer    | references |  foreign_key: true   |
| user     | references | foreign_key: true    |



### association

- belongs_to :user
- belongs_to :item
- has_one :address



## addressテーブル

| Column         | Type       | Option                        |
| -----          | ----       |  ------                       |
| post_code      | integer    | null:false                    |
| prefectures    | string     | null:false                    |
| manicipalities | string     | null:false                    |
| address        | string     | null: false                   | 
| building       | string     |                               | 
| buyer          | references | null:false, foreign_key: true |

### association

- belongs_to :buyer

## items テーブル

| Column        | Type       | Option            |
| ------        | -----      | ------            |
| name          | string     | null: false       |
| infomation    | text       | null: false       |
| category      | string     | null:false        |  
| condition     | string     | null: false       | 
| postage       | string     | null: false       | 
| region        | string     | null: false       | 
| shipping_days | integer    | null: false       |
| price         | integer    | null:false        |
| seller        | references | foreign_key: true | 

## association

- has_one :buyer
- belongs_to :user