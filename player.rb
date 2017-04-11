class Player < Users
  attr_accessor :bank, :cards

  def initialize
    @bank = 100
    @cards =[]
  end
end
