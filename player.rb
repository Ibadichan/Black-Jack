class Player < User
  attr_accessor :bank, :cards

  def initialize
    @bank = 100
    @cards =[]
  end
end
