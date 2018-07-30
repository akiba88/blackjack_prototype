class Deck
  class << self
    def cards
      [
        { lable: '2', value: 2 },
        { lable: '3', value: 3 },
        { lable: '4', value: 4 },
        { lable: '5', value: 5 },
        { lable: '6', value: 6 },
        { lable: '7', value: 7 },
        { lable: '8', value: 8 },
        { lable: '9', value: 9 },
        { lable: '10', value: 10 },
        { lable: 'jack', value: 10 },
        { lable: 'queen', value: 10 },
        { lable: 'king', value: 10 },
        { lable: 'ace', value: 11 }
      ]
    end

    def suits
      %w[spades clubs diamonds hearts]
    end
  end
end
