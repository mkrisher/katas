class Balancer
  ALPHABET = ("a".."z").to_a

  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def run
    balance_point = nil

    word[1..word.length].chars.each_with_index do |letter, index|
      offset        = index + 1
      balance_point = offset if balanced?(offset)
    end

    return formatted_string(balance_point) if balance_point

    word
  end

  private

  def formatted_string(balance_point)
    word[0..(balance_point - 1)] + " " + word[balance_point] + " " + word[(balance_point + 1)..word.length]
  end

  def letter_weight(letter)
    ALPHABET.index(letter.downcase) + 1
  end

  def balanced?(position)
    left_side(position) == right_side(position)
  end

  def left_side(position)
    letters = word[0..position - 1].chars
    score   = 0

    letters.each_with_index do |letter, index|
      score += letter_weight(letter) * (position - index)
    end

    return score
  end

  def right_side(position)
    letters = word[position + 1..word.length].chars
    score   = 0

    letters.each_with_index do |letter, index|
      score += letter_weight(letter) * (index + 1)
    end

    return score
  end
end

