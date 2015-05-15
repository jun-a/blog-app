### プロジェクト用の設定

プロジェクトに必要なライブラリをインストール

```
$ bundle install --path vendor/bundle
```

### DB作成

```sql
CREATE DATABASE studyblog_develop;
CREATE DATABASE studyblog_test;
```

### DB 設定

必要なテーブルを作成

```sh
$ bin/rake db:migrate
```

DB に初期データを追加

```sh
$ bin/rake db:seed
```

### 基本的な使い方

```sh
バージョンを確認
$ bin/rails --version

rails コンソールを起動
$ bin/rails c

ローカル開発サーバーを起動 (http://localhost:3000/ でアクセスできる)
$ bin/rails server

route の確認
$ bin/rake routes

DB のマイグレーション
$ bin/rake db:migrate

DB にシードデータを追加
$ bin/rake db:seed

rake コマンドの確認
$ bin/rake -T

コーディングのチェック
$ bin/rubocop

テストを実行
$ bin/rspec
```
