class Word < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  def self.search(search)
    if search != ""
      Word.where('pronunciation_c LIKE(?)', "%#{search}%").or Word.where('english LIKE(?)', "%#{search}%").or Word.where('fantizi LIKE(?)', "%#{search}%").or Word.where('jiantizi LIKE(?)', "%#{search}%")
      #Classmate.where(class_id: 2).or(Classmate.where(club_name: 'tennis')) のようになります。
      #Word.where('fantizi LIKE(?)', 'jiantizi LIKE(?)',  "%#{search}%")
      #User.where(name: "ぴっか").or(User.where(age: 22))
    else
      #(Word.where('fantizi LIKE(?)', "%#{search}%")).or
      #(Word.where('pronunciation_c LIKE(?)', "%#{search}%")).or
      #(Word.where('english LIKE(?)', "%#{search}%")).else
    # elsif
    #   Word
    # elsif
      
    #    = Word
    #   #Word.where('jiantizi LIKE(?)', "%#{search}%")
    #   #|| Word.where('pronunciation_c LIKE(?)', "%#{search}%")
    #   #|| Word.where('english LIKE(?)',"%#{search}%") 
    # #  Word.where('fantizi LIKE(?)',"%#{search}%")
    # #elsif unless jiantizi && fantizi
    #   #Word.where('pronunciation_c LIKE(?)',"%#{search}%")
    # #elsif
    # #  Word.where('english LIKE(?)',"%#{search}%")
      Word.all
    end
  end
end
