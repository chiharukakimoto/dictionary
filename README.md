アプリケーション名
dictionary

アプリケーション概要	このアプリケーションでできることを記述。
普段よく使う外国語をメモして手軽に確認できる。

URL	デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。

テスト用アカウント	ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。

利用方法	このアプリケーションの利用方法を記述。

目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。
中国語には簡体字と繁体字がある。
中国語学習者は基本的に簡体字を学習するが、テレビの字幕や中国大陸以外の中国語では主に繁体字が使用されている。
そのため中国語の学習者に簡体字と繁体字を一緒に登録し、並べる事により自然と目に入り繁体字の雰囲気を自然に覚える事を目指している。

洗い出した要件	スプレッドシートにまとめた要件定義を記述。

実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。

画像はGyazoで、GIFはGyazoGIFで撮影すること。

実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

データベース設計	ER図等を添付。

ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。


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
