class User::Dealer < User
  def dealer?
    true
  end

  def gamer?
    false
  end
end
