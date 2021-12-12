class CantoneseValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value) # バリデーションメソッド
    if cantonese?(value)
      record.errors.add attribute, (options[:message] || "is not Fantizi")
      # record.errors.add(attribute, " は中国語ではありません。")
    end
  end

  CODEPOINTS =
  {
    japanese_kun: File.read("#{Rails.root}/app/models/concerns/japanese_kun"),
    japanese_on:  File.read("#{Rails.root}/app/models/concerns/japanese_on"),
    cantonese:    File.read("#{Rails.root}/app/models/concerns/cantonese"),
    mandarin:     File.read("#{Rails.root}/app/models/concerns/mandarin"),
  }.freeze

  # size == 1のStringをcodepointに変換する
  def to_codepoint(character)
    #raise "size == 1のStringを与える必要がある" unless character.size == 1
    character.codepoints.map{|cp| sprintf("%04X", cp)}.first
  end

  # 以下のように書きたいところだが重いので正規表現でやる
  # CODEPOINTS[:japanese_kun].include?(codepoint) # (CODEPOINTS[:japanese_kun]を配列にしておいた上で)
  def japanese_kun?(codepoint)
    !!(CODEPOINTS[:japanese_kun] =~ /\nU\+#{codepoint}\n/)
  end

  def japanese_on?(codepoint)
    !!(CODEPOINTS[:japanese_on] =~ /\nU\+#{codepoint}\n/)
  end

  def cantonese?(codepoint)
    !!(CODEPOINTS[:cantonese] =~ /\nU\+#{codepoint}\n/)
  end

  def mandarin?(codepoint)
    !!(CODEPOINTS[:mandarin] =~ /\nU\+#{codepoint}\n/)
  end

  # 漢字か判定
  def han?(character)
    character =~ /\p{Han}/
  end

  # 文字列から中国語らしき文字をselectする。
  # なぜか漢字以外のcodepointを与えると期待した動作をしないので、漢字のみで判定する。
  def select_chinese_and_not_japanese(survey_target_string)
    survey_target_string.split('').select do |character|
      next if !han?(character)

      codepoint = to_codepoint(character)
      next if japanese_kun?(codepoint) || japanese_on?(codepoint)
      next if !(cantonese?(codepoint) || mandarin?(codepoint))

      true
    end
  end
end


