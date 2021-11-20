class Category < ActiveHash::Base
self.data = [
  { id: 1, name: '--' },
  { id: 2, name: '名詞' },
  { id: 3, name: '代名詞' },
  { id: 4, name: '関係代名詞' },
  { id: 5, name: '動詞' },
  { id: 6, name: '他動詞' },
  { id: 7, name: '自動詞' },
  { id: 8, name: '助動詞' },
  { id: 9, name: '形容詞' },
  { id: 10, name: '副詞' },
  { id: 11, name: '前置詞' },
  { id: 12, name: '接続詞' },
  { id: 13, name: '感嘆詞' },
  { id: 14, name: '定冠詞' },
  { id: 15, name: '不定冠詞' },
  { id: 16, name: '接頭辞' },
  { id: 17, name: '接尾辞' },
  { id: 18, name: '連結詞' },
  { id: 19, name: '最上級' },
  { id: 20, name: '四文字熟語' },
  { id: 21, name: '諺' },
  { id: 22, name: 'その他' }
]

include ActiveHash::Associations
  has_many :words

end
