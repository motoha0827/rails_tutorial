chapter13

エラー
ActiveRecord::DuplicateMigrationNameError: 
(同じ名前のmigrateファイルがあるよ)
コマンド同じの入力して同じファイルができてたっぽい
解決法
直接dbのmigrateの名前かぶってるファイル消した
rails db:migrate:down VERSION=********
*******は、rails db:migrate:statusで確認して消したいファイルのMigration IDを入れる
rails db:migrate RAILS_ENV=test
これでrails testが実行できた
