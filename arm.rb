class ARM
  attr_accessor :bank, :cards, :methods

  def initialize
    @bank = 100
    @cards =[]
    @methods = ['skip_a_move','add_card','open_all_cards']
  end

end