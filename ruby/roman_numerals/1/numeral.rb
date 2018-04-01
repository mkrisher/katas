class RomanNumeral
  ROMAN_NUMERALS = [
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  def convert(number)
    result = ""

    ROMAN_NUMERALS.each do |num, glyph|
      while number >= num
        result << glyph
        number -= num
      end
    end

    return result
  end
end

