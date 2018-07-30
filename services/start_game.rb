class StartGame
  def initialize(session)
    @session = session
  end

  def call
    session.build_pack

    Game::Core.init_new_game(session)
  end

private

  attr_reader :session
end
