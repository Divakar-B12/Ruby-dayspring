class ProfanityValidator < ActiveModel::EachValidator
  BAD_WORDS = %w[damn
  badword
  crap
  hell
  idiot
  stupid
  dumb
  fool
  ugly
  loser
  bastard]

  def validate_each(record, attribute, value)
    if BAD_WORDS.any? { |word| value.to_s.downcase.include?(word) }
      record.errors.add(attribute, "contains inappropriate language")
    end
  end
end
