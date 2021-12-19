アプリ名

dictionary

【アプリケーション概要】

普段よく使う中国語や英語を登録して隙間時間で確認、学習ができる。
また、他ユーザーが登録した単語も見ることができ相互学習ができる。

【本番環境】

https://dictionary-36185.herokuapp.com/

【アカウント】

テスト用アカウント：qianchun@hotmail.co.jp

パスワード:chiharu0308

【作成背景】

中国語学習者に簡体字と繁体字の見比べられる単語帳等して活用してもらいたいと開発した。
一般的に中国語学習者は簡体字で中国語を読み書きできる様に学ぶ。
しかし、中国語には簡体字と繁体字があり、テレビの字幕や台湾、香港では繁体字が使用される。
その際に繁体字の中国語を読み書きできない学習者が出てくる。
この問題を解決するために中国語学習者が普段使う中国語の繁体字を登録、目に触れることで自然と記憶、書けないけど読むことはできる状態を目指している。
また、国際社会での主要言語は英語のため、中国語で表現する場合英語では？とふとした疑問を調べて気軽に登録できると連想ゲームの様に語学の幅が広がるのではないかと考えた。

【DEMO】

トップページ

[![Image from Gyazo](https://i.gyazo.com/4aa7590ad39d987af52dbf251bed1a74.png)](https://gyazo.com/4aa7590ad39d987af52dbf251bed1a74)

新規登録画面

[![Image from Gyazo](https://i.gyazo.com/0704a764be505f8080095deabc2f0cfb.png)](https://gyazo.com/0704a764be505f8080095deabc2f0cfb)

詳細表示画面

[![Image from Gyazo](https://i.gyazo.com/02b56f8916378f2a1a59a15f0fd6d6f4.png)](https://gyazo.com/02b56f8916378f2a1a59a15f0fd6d6f4)

編集・削除画面

[![Image from Gyazo](https://i.gyazo.com/cd81cb4dcabbb0bea3e700ce85bab534.png)](https://gyazo.com/cd81cb4dcabbb0bea3e700ce85bab534)


【工夫したポイント】

検索機能;複数の条件で検索ができるように実装。

バリデーション;中国語漢字であれば登録出来る様に実装。

【開発環境】

バックエンド

Ruby, Ruby on Rails

ruby 2.6.5p114
Rails 6.0.4.1

フロントエンド

HTML, CSS

データベース

MySQL

インフラ

アプリケーションサーバー(本番環境)
heroku

ソース管理
GitHub, GitHubDesktop

エディタ
VSCode

【課題や今後実装したい機能】
中国語漢字と日本漢字は同じものがあるため、厳密に分けるのは困難である。
中国語のバリデーションをオリジナルで作成したが、簡体字と繁体字で分けるためには現在参考にしているデータでは重複しており綺麗に分けることができていない。
現在バリデーションの精度を上げるための方法を検討中。

【DB設計】

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |

belongs_to :word

## words テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| jiantizi        | text       | null: false                    |
| fantizi         | text       | null: false                    |
| english         | text       | null: false                    |
| pronunciation_c | text       | null: false                    |
| pronunciation_e | text       | null: false                    |
| category_id     | integer    | null: false                    |
| mean            | text       | null: false                    |
| memo            | text       | null: false                    |

has_many :users

## validation input data
[Reference](https://shinya131-note.hatenablog.jp/entry/2015/07/10/004853)
```bash
cat Unihan_Readings.txt | awk '$2 ~ /kJapaneseKun/ {print $1}' > japanese_kun
cat Unihan_Readings.txt | awk '$2 ~ /kJapaneseOn/ {print $1}'  > japanese_on
cat Unihan_Readings.txt | awk '$2 ~ /kMandarin/ {print $1}'    > mandarin
cat Unihan_Readings.txt | awk '$2 ~ /kCantonese/ {print $1}'   > cantonese
```