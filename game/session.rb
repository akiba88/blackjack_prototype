class Game
  class Session
    attr_reader :dealer, :gamer, :pack
    attr_accessor :rate, :basket

    def initialize
      @dealer = User::Dealer.new
      @gamer = User::Gamer.new
      @basket = []
      @rate = 0
    end

    def build_pack
      @pack = BuildPack.call
    end
  end
end
