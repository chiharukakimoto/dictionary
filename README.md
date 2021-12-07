アプリケーション名
dictionary

【アプリケーション概要】
普段よく使う中国語や英語を登録して隙間時間で確認、学習ができる。
また、他ユーザーが登録した単語も見ることができ相互学習ができる。

【URL】
https://dictionary-36185.herokuapp.com/


【アカウント】
テスト用アカウント：qianchun@hotmail.co.jp
パスワード:chiharu0308

【利用方法】
テレビの字幕や台湾、香港に旅行に行った際や日常生活のふとした時に気になった身近にある中国語を登録する。
登録時に簡体字と繁体字も一緒に登録することにより繁体字も読めるようにする。

【目指した課題解決】
中国語学習者に簡体字と繁体字の見比べられる単語帳等して活用してもらいたいと開発した。
一般的に中国語学習者は簡体字で中国語を読み書きできる様に学ぶ。
しかし、中国語には簡体字と繁体字があり、テレビの字幕や台湾、香港では繁体字が使用される。
その際に繁体字の中国語を読み書きできない学習者が出てくる。
この問題を解決するために中国語学習者が普段使う中国語の繁体字を登録、目に触れることで自然と記憶、書けないけど読むことはできる状態を目指している。
また、国際社会での主要言語は英語のため、中国語で表現する場合英語では？とふとした疑問を調べて気軽に登録できると連想ゲームの様に語学の幅が広がるのではないかと考えた。

【要件定義】
ユーザー登録機能
単語登録機能
単語編集機能
単語削除機能
単語検索機能

【】
実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。

【データベース設計】

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

【開発環境】
ruby 2.6.5p114
Rails 6.0.4.1