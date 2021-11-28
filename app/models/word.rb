class Word < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  def self.search(search)
    if search != ""
      Word.where('pronunciation_c LIKE(?)', "%#{search}%").or Word.where('english LIKE(?)', "%#{search}%").or Word.where('fantizi LIKE(?)', "%#{search}%").or Word.where('jiantizi LIKE(?)', "%#{search}%")
    else
      Word.all
    end
  end
end
