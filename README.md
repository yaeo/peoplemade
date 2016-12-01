### People Made[ピープルメイド]とは？
People Madeは、商品とそのバックグラウンドストーリーを投稿/共有できるポータルサイトです。

### What is People Made?
People Made is a place where you can post and share your products and the background story of products and your story.

### Its on Internet 🎉 http://52.199.137.129/
Please take a look and let me know if you have any advise.

## DBテーブル設計
### user
#### association
    - has_many  :stories
    - has_one   :address
    - has_one   :company
    - has_one   :sns

#### columns
    deviseで自動作成予定

### address
#### association
    - belongs_to :user

#### columns
    - user_id    t.refference :user
    - zipcode1   t.integer
    - zipcode2   t.integer
    - prefecture t.string
    - address1   t.string
    - address2   t.string
    - telephone  t.integer

### company
#### association
    - belongs_to :user

#### columns
    - user_id              t.refference  :user
    - name                 t.string, null: false
    - kana                 t.string, null: false
    - custom_url           t.string, null: false
    - contact_person_name  t.string, null: false
    - contact_person_kana  t.string, null: false
    - logo                 t.string
    - cover_image          t.string
    - homepage_url         t.string
    - industry_type        t.string
    - profile              t.text
    - vision               t.text
    - establish_y          t.integer
    - establish_m          t.integer
    - establish_d          t.integer
    - recruit_url          t.string
    - about_url            t.string

### social
#### association
    - belongs_to :user

#### columns
    - user_id    t.refference :user
    - facebook   t.string
    - twitter    t.string
    - youtube    t.string
    - instagram  t.string
    - wantedly   t.string

### story
#### association
    - belongs_to  :user
    - has_many    :topics
#### columns
	- user_id      t.refferece :user
	- title        t.string, null: false
	- intro        t.string, null: false
	- status       t.integer, null: false

### topic
#### association
    - belongs_to :story

#### columns
	- story_id     t.refferece :story
	- image        t.string
	- caption      t.text
	- content      t.text


## 画面遷移図
![遷移図](https://cloud.githubusercontent.com/assets/1336608/19686418/05b3bda0-9afc-11e6-8bde-a2715b879b5a.png)
