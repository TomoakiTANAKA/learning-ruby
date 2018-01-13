
### 新規ライブラリ追加

1. Gemfileにgemを追加
1. bundleで追加したgemをインストール

```
cd path/to/learning-sinatora
bundle install --path=./
```

### 新規ファイル追加

インストールgemからrequireを行うための設定が必要。
下記を追加しておくこと
```
require "rubygems"
require "bundler/setup"
```

### 実行方法
```
bundle exec ruby hoge.rb
```
