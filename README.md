chapter14

  Micropost.where("user_id IN (#{following_ids})
                   OR user_id = :user_id", user_id: id)
                   ↓
  Micropost.where(user_id: following_ids).or(Micropost.where(user_id: id))

feedの条件
フォローしているユーザーのマイクロポストがフィードに含まれていること
自分自身のマイクロポストもフィードに含まれていること
フォローしていないユーザーのマイクロポストがフィードに含まれていないこと

能動的関係と受動的関係

複合キーインデックス
follower_idとfollowed_idの組み合わせがユニークであることを保証
add_index :relationships, :follower_id
add_index :relationships, :followed_id
add_index :relationships, [:follower_id, :followed_id], unique: true

has_many through
Railshaモデル名（単数形）に対応する外部キーを探す
has_many :followeds, through: :active_relationships
上記のコードだとfollowedsというシンボルを見てfollowedに変えて、
relationshipsテーブルのfollowed_idを使い、対象のユーザを取得してくる。

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

chapter12

# %記法まとめ

参考：https://qiita.com/mogulla3/items/46bb876391be07921743
カッコは（）でも[]でも何でもおけ！

％、％Q
ダブルクオーテーションと同様
%(あああ)
("あああ”)

%q
シングルクオーテーションと同様
%q(あああ)
('あああ')

%w
配列を作る。式は展開されない。スペースで区切れる。[]じゃなくて()
%w(a b c d e)
["a", "b", "c", "d", "e"]

%W
配列を作る。式が展開される。

%i
要素がシンボルの配列を作る。式は展開されない。
%i(a b c)
[:a :b :c]

%I
要素がシンボルの配列を作る。式が展開される。

%s
シンボル。シンボルの展開はされない。
%s(a)
:a

### privateメソッドはインデントを下げない！！！！private行と揃える！！！！
### クラス定義の後ろに空行は不要！！！！

## update_attributeとupdateの違い
# update_attribute
レコードの、１つのカラムを変更できる。カラム名と値を区切る。
ただし、バリデーションチェックがされないため使用は非推奨。
# update!
updateは保存の成否をtrueかfalseで返すのに対し、update!は保存に失敗したときに例外を返す。

# commitメッセージのコツ
一行目 タイトル
二行目 空行
三行目 叩いたコマンドや補足

# PR
タイトルやdescriptionでちゃんと説明する
