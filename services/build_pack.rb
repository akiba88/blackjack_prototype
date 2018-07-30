class BuildPack
  class << self
    def call
      pack.shuffle
    end

  private

    def pack
      Deck.suits.reduce([]) do |result, suit|
        result += Deck.cards.map do |hash|
          hash[:lable] = "#{hash[:lable]} #{suit}"
          hash
        end
      end
    end
  end
end
