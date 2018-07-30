class Game
  class Core
    class << self
      def ask_action(session)
        case ask_action_block
        when 1
          strategy = CheckScore.new(session).call('continue', session.dealer)

          ProcessStrategy.new(session).call(strategy)
        when 2
          take_card(session)

          startegy = CheckScore.new(session).call('continue', session.gamer)

          ProcessStrategy.new(session).call(startegy)
        when 3
          Game::Core.decrement(session)

          end_game(session)
        end
      end

      def end_game(session)
        p "Ваш счет: #{session.gamer.money}"
      end

      def init_new_game(session)
        return end_game(session) if session.gamer.money <= 0

        place_bet(session)

        processing_basket(session)

        session.dealer.hand = session.pack.shift(2)
        p "Карты дилера: #{session.dealer.hand.first}"
        session.gamer.hand = session.pack.shift(2)
        p "Выши карты: #{session.gamer.hand}"

        strategy = CheckScore.new(session).call('init')

        ProcessStrategy.new(session).call(strategy)
      end

      def increment(session)
        session.gamer.money += session.rate * 0.5
      end

      def decrement(session)
        session.gamer.money -= session.rate * 1.5
      end

      def take_card(session)
        session.gamer.hand << session.pack.shift

        p "Выши карты: #{session.gamer.hand}"
        p "Выш счет: #{session.gamer.score}"
      end

    private

      def ask_action_block
        p 'Ваши действия:'
        p '1. результат'
        p '2. карту'
        p '3. закончить'

        stage = gets.strip.to_i

        ask_action_block unless [1, 2, 3].include?(stage)

        stage
      end

      def place_bet(session)
        p "Ваша ставка(#{session.gamer.money}): "

        session.rate = gets.strip.to_i

        place_bet(session) if session.rate < 1 || session.rate > session.gamer.money
      end

      def processing_basket(session)
        session.basket += session.dealer.hand
        session.basket += session.gamer.hand

        return if session.pack.size > 15

        session.pack = (session.pack + session.basket).shuffle
        session.basket = []
      end
    end
  end
end
