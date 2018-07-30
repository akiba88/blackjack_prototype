class CheckScore
  def initialize(session)
    @session = session
  end

  def call(stage, user = nil)
    case stage
    when 'init' then init_stage
    when 'continue' then continue_stage(user)
    when 'finish' then finish_stage
    end
  end

private

  attr_reader :session

  def init_stage
    session.gamer.blackjack? ? 'win' : 'gamer_turn'
  end

  def continue_stage(user)
    if user.dealer?
      return 'lose' if session.gamer.score > 21
      return 'win' if user.score > 21

      return 'dealer_turn' if user.score < 18 && user.score < session.gamer.score

      user.score < session.gamer.score ? 'win' : 'lose'
    else
      return 'dealer_turn' if session.gamer.blackjack?

      user.score > 21 ? 'lose' : 'gamer_turn'
    end
  end

  def finish_stage
    return 'lose' if session.gamer.score > 21
    return 'draw' if session.gamer.score == session.dealer.score

    session.gamer.score > session.dealer.score ? 'win' : 'lose'
  end
end
