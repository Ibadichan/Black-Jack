class Dealer < Users
  attr_accessor :bank, :cards, :message

  def initialize(players,deck)
    @bank = 100
    @cards =[]
    @players = [players, self]
    @deck = deck
    give_out_cards
  end

  def give_out_cards
    @players.each do |player|
      player.cards << @deck.cards[0] << @deck.cards[1]
      @deck.give_a_card(0)
      @deck.give_a_card(1)
    end
  end

  def move_of_dealer
    if Score.count(self.cards) <  15
      add_card(@deck)
      @message = 'dealer added card'
   else
      @message = 'dealer skips a move'
    end
  end
end
