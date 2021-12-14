class Word < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  # validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  #with_options presence: true do
  validates :jiantizi, mandarin: true
  validates :fantizi, cantonese: true
  # validates :pronunciation_c
  #end
  #validates :english, format: {with: /\A[a-zA-Z0-9]+\z/}

  def self.search(search)
    if search != ""
      Word.where('pronunciation_c LIKE(?)', "%#{search}%").or Word.where('english LIKE(?)', "%#{search}%").or Word.where('fantizi LIKE(?)', "%#{search}%").or Word.where('jiantizi LIKE(?)', "%#{search}%")
    else
      Word.all
    end
  end
end
