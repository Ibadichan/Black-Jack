class User
  METHODS =  %w(skip_a_move add_card open_all_cards)

  attr_accessor :bank, :cards

  def initialize
    @bank = 100
    @cards =[]
  end

  def add_card(deck)
    @deck = deck
    self.cards << @deck.cards[0]
    @deck.give_a_card(0)
  end
end
