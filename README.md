# 概要

## アプリケーション説明

Qiitaは、プログラミングに関する知識を記録・共有するためのサービスです。

## 詳細

作れる投稿の種類は3つ

### 投稿
ノウハウを含めた、記事の投稿を行う
タグでの整理も可能

### フォロー・ストック
自分が気になった人をフォローし、ユーザーごとに投稿を確認できる
気に入った投稿をストックして置くことも可能

### コメント・
投稿されている記事についてのコメント及び編集リクエストが可能

### 検索
キーワードで関連する記事を検索可能

# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string||
|profile_image|string|
|profile_text|string|



### Associations
- has_many :ariticle
- has_many :follows, dependent: :destroy


## ariticle table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|title|string|null:false|
|content|string|null: false|
|ariticle_image|string|foreign_key: true|
|draft_status|integer|null:false|
|publish_status|integer|null: false|

### Associations
- belongs_to :user
- has_many :ariticle_images
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :tags, through: :ariticle_tag




### Associations
- belongs_to :aritcle


## ariticle_images table

|Column|Type|Options|
|------|----|-------|
|ariticle_image|string|null: false|


### Associations
- belongs_to :ariticle


## comments table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|ariticle_id|references :ariticle|null: false, foreign_key: true|
|text|string|null: false|

### Associations
- belongs_to :ariticle


## likes table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|aritcle_id|references :ariticle|null: false, foreign_key: true|

### Associations
- belongs_to :ariticle


## tags table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Associations
- has_many :aritcles, through: :aritcle_tags


## ariticle_tag table

|Column|Type|Options|
|------|----|-------|
|tag_id|references :tag|null: false, foreign_key: true|
|ariticle_id|references :ariticle|null: false, foreign_key: true|

### Associations
- belongs_to :tag
- belongs_to :article


## follows table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|followed_id|integer|null: false|

### Associations
- belongs_to :user
