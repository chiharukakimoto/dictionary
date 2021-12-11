class Word < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  validates :jiantizi, presence: true, format: {with: /\p{Han}/, mandarin: true}

  validates :fantizi, presence: true, format: {with: /\p{Han}/u}
  validates :english, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :pronunciation_c, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  def self.search(search)
    if search != ""
      Word.where('pronunciation_c LIKE(?)', "%#{search}%").or Word.where('english LIKE(?)', "%#{search}%").or Word.where('fantizi LIKE(?)', "%#{search}%").or Word.where('jiantizi LIKE(?)', "%#{search}%")
    else
      Word.all
    end
  end
end
