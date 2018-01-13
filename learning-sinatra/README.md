# web service with sinatra

sinatraを使ったWebサービス

## 実行方法
```
bundle exec ruby src/main.js -p 3001
```

localhost:3001にアクセスできればOK

### 新規ライブラリ追加

1. Gemfileにgemを追加
1. bundleで追加したgemをインストール

```
cd path/to/learning-sinatora
bundle install --path=./
```

## 開発Tips
### 新規ファイル追加

インストールgemからrequireを行うための設定が必要。
下記を追加しておくこと
```
require "rubygems"
require "bundler/setup"
```

## TODO

- [ ] scssの導入
- [ ] haml導入
- [ ] typescript導入
- [ ] erbの分割
