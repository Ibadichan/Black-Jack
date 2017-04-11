class Dealer < User
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
      2.times do
       player.cards << @deck.give_a_card
      end
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
