class User::Gamer < User
  attr_writer :money

  def blackjack?
    score == 21
  end

  def money
    @money ||= 500
  end
end
