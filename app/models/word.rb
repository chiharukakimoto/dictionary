class Word < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  def self.search(search)
    if search != ""
      Word.where('jiantizi LIKE(?)', "%#{search}%")
    elsif
      Word.where('fantizi LIKE(?)', "%#{search}%")
    elsif
      Word.where('pronunciation_c LIKE(?)', "%#{search}%")
    elsif
      Word.where('english LIKE(?)', "%#{search}%")
    else
      Word.all
    end
  end
end
