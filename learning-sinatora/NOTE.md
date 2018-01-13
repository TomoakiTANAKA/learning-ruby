
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
