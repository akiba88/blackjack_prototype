class User
  attr_writer :hand

  def dealer?
    false
  end

  def gamer?
    true
  end

  def hand
    @hand ||= []
  end

  def score
    result = hand.sum { |hash| hash[:value] }

    if result > 21 && hand.find { |hash| hash[:value] == 11 }
      val =
        hand.map do |hash|
          hash[:value] = 1 if hash[:value] == 11
          hash
        end

      val.sum { |hash| hash[:value] }
    else
      result
    end
  end
end
