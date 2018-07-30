# BlacJack
# load 'game.rb'

load 'deck.rb'
load 'user.rb'
Dir['user/*.rb'].each { |file| load file }

Dir['game/*.rb'].each { |file| load file }
Dir['services/*.rb'].each { |file| load file }

class Game
  def start
    StartGame.new(session).call
  end

private

  def session
    @session ||= Game::Session.new
  end
end
