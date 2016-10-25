## user
#### association
    - has_many  :stories
    - has_one   :address
    - has_one   :company
    - has_one   :sns

#### columns
    deviseで自動作成予定

## address
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

## company
#### association
    - belongs_to :user

#### columns
    - user_id              t.refference  :user
    - name                 t.string, null: false
    - kana                 t.string, null: false
    - open_url             t.string, null: false
    - contact_person       t.string, null: false
    - contact_person_kana  t.string, null: false
    - logo                 t.string
    - cover_image          t.string
    - homepage_url         t.string
    - industry             t.string
    - profile              t.text
    - vision               t.text
    - establish_y          t.integer
    - establish_m          t.integer
    - establish_d          t.integer
    - recruit_url          t.string
    - about_url            t.string

## sns
#### association
    - belongs_to :user

#### columns
    - user_id    t.refference :user
    - facebook   t.string
    - twitter    t.string
    - youtube    t.string
    - instagram  t.string
    - wantedly   t.string

## story
#### association
    - belongs_to  :user
    - has_many    :topics
#### columns
	- user_id      t.refferece :user
	- title        t.string, null: false
	- intro        t.string, null: false
	- status       t.integer, null: false

## topic
#### association
    - belongs_to :story

#### columns
	- story_id     t.refferece :story
	- image        t.string
	- caption      t.text
	- content      t.text
