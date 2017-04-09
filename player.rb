class Player
  attr_accessor :bank, :cards, :methods

  def initialize
    @bank = 100
    @cards =[]
    @methods = %w(skip_a_move add_card open_all_cards)
  end

end