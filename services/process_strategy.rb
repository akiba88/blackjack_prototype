class ProcessStrategy
  def initialize(session)
    @session = session
  end

  def call(strategy)
    return gamer_turn_strategy if strategy == 'gamer_turn'
    return dealer_turn_strategy if strategy == 'dealer_turn'

    case strategy
    when 'win' then win_strategy
    when 'lose' then lose_strategy
    end

    p '===================================='
    p "Карты дилера: #{session.dealer.hand}"
    p "Ваши карты: #{session.gamer.hand}"
    p '===================================='

    Game::Core.init_new_game(session)
  end

private

  attr_reader :session

  def win_strategy
    p 'WIN'
    Game::Core.increment(session)
  end

  def lose_strategy
    p 'LOSE'
    Game::Core.decrement(session)
  end

  def gamer_turn_strategy
    Game::Core.ask_action(session)
  end

  def dealer_turn_strategy
    session.dealer.hand << session.pack.shift

    strategy = CheckScore.new(session).call('continue', session.dealer)

    ProcessStrategy.new(session).call(strategy)
  end
end
