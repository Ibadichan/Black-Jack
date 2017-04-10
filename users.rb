class Users
  attr_accessor :bank, :cards, :methods

  def initialize
    @bank = 100
    @cards =[]
    @methods = %w(skip_a_move add_card open_all_cards)
  end

  def add_card(deck)
    @deck = deck
    element = @deck.all_cards[rand(@deck.all_cards.length)]
    self.cards << element
    @deck.all_cards.delete(element)
  end
end
