# Ameblo2Markdown

## 作った理由
Ameblo2Markdown を作った理由は二つあります
- 過去に書いた記事をhtmlだけで持っているのはメンテ&&利便性かける
- 自分のホームページで過去の記事を見れるようにしたい

## 使い方

### Step 1
```sh
% bundle install
```
### Step 2
`user_name` に自分のアメブロのidを入れる

```rb
# ameblo.rb

user_name = 'ameblo_user_id'
url = "http://ameblo.jp/#{user_name}/entrylist.html"
```

### Step 3
以下のコマンドを実行する

```sh
% ruby ameblo.rb
```

### Step 4
`posts` 以下のフォルダーに自分の過去の記事がmdで作られてる

## 参考にした記事とコード

[各種ブログサービスの過去記事を全て取得する](http://qiita.com/ya_s_u/items/c4f027df9be34fad8be5)
Made by @ya-s-u
