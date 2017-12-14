class User
  METHODS = %w[skip_a_move add_card open_all_cards].freeze

  attr_accessor :bank, :cards

  def initialize
    @bank = 100
    @cards = []
  end

  def add_card(deck)
    cards << deck.give_a_card
  end
end
