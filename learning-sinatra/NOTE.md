
bundler
bundle init
bundleの中に書き込む
インストール

-----------


sinatra???

軽量なwebフレームワーク
いろんな機能はない

実行

bundle exec ruby src/main.rb

bundle install --path=./

実行するとWebrickが起動する

[2018-01-13 11:44:24] INFO  WEBrick 1.3.1
[2018-01-13 11:44:24] INFO  ruby 2.2.3 (2015-08-18) [x86_64-darwin15]
== Sinatra (v2.0.0) has taken the stage on 4567 for development with backup from WEBrick
[2018-01-13 11:44:24] INFO  WEBrick::HTTPServer#start: pid=77728 port=4567

port=xxxでポートが指定されているので、
http://localhost:4567
でアクセスできる。

bundle exec ruby src/main.rb -p 3001        

とすると、port指定ができる

# チュートリアル

sinatra-reloader

コード変えて、サーバー再起動しなくても自動的に変更が反映される


## Tips

### 変数の埋め込み



文字を出力する

get '/' do
  now = Time.now
  "Hello World こんにちは #{now}"
end


erb


### テンプレート
erb自体はsinatraではない？？？
sinatraの場合は、viewsを探す？

同じディレクトリにある、views/index.erbを探す

イチを変更するには？？？
ファイル名探すルールを探すには？？？


  <p>現在時刻：<% @now %></p>
  
  「=」をつけると中身が表示される
  
  <p>現在時刻：<%= @now %></p>

### 静的コンテンツ

cssなどの静的ファイルは、同一フォルダ
publicにいれる
/つけても、つけなくてもOK

### フォームとデータ送信

paramsでハッシュ形式のデータが渡ってくる

## エラー処理
sinatraがエラーメッセージを書いてくれている

メソッドがないよ = ページがないよ

## 参考
http://sinatrarb.com/intro.html

---

## activeレコードとの連携

### Gemfileに記述する
gem 'sinatra-activerecord'
gem 'sqlite3'
gem 'rake'


### インストール
bundle install

## コード記述する

```
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
```

## rakeファイルをつくる

rakeでDBつくる、のかな？
# Rakefile

```
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./src/main"
  end
end
```

### 動かす
```
bundle exec rake -T

rake db:create              # Creates the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:create:all to create all databases in t...
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:drop:all to drop all databases in the con...
rake db:environment:set     # Set the environment value for the database
rake db:fixtures:load       # Loads fixtures into the current environment's database
rake db:migrate             # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status      # Display status of migrations
rake db:rollback            # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear  # Clears a db/schema_cache.yml file
rake db:schema:cache:dump   # Creates a db/schema_cache.yml file
rake db:schema:dump         # Creates a db/schema.rb file that is portable against any DB supported by Active Record
rake db:schema:load         # Loads a schema.rb file into the database
rake db:seed                # Loads the seed data from db/seeds.rb
rake db:setup               # Creates the database, loads the schema, and initializes with the seed data (use db:reset to also drop the database first)
rake db:structure:dump      # Dumps the database structure to db/structure.sql
rake db:structure:load      # Recreates the databases from the structure.sql file
rake db:version             # Retrieves the current schema version number

```

schema.rbが生成される

## モデルつくる

## 保存してみる

name = params[:name]
contact = Contacts.new({name: name})
contact.save

ログに以下のメッセージがでる
D, [2018-01-13T16:21:15.626123 #98079] DEBUG -- :    (0.2ms)  begin transaction
D, [2018-01-13T16:21:15.643803 #98079] DEBUG -- :   SQL (0.7ms)  INSERT INTO "contacts" ("name") VALUES (?)  [["name", "ああああ"]]
D, [2018-01-13T16:21:15.644717 #98079] DEBUG -- :    (0.6ms)  commit transaction



bundle exec rake db:create_migration NAME=create_users


参考
https://github.com/janko-m/sinatra-activerecord