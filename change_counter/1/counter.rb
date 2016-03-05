class Counter
  VALUES = [
    [25, "quarter"],
    [10, "dime"],
    [5, "nickel"],
    [1, "penny"]
  ]

  def coins(money)
    result = []

    VALUES.each do |value, string|
      while money >= value
        result << string
        money -= value
      end
    end

    return result
  end
end
