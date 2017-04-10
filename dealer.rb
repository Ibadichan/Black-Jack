class Dealer < Users
  attr_accessor :bank, :cards, :message

  def initialize(player,deck)
    @bank = 100
    @cards =[]
    @player = player
    @deck = deck
    give_out_cards
  end

  def give_out_cards
    2.times do
      element = @deck.all_cards[rand(@deck.all_cards.length)]
      @player.cards << element
      @deck.all_cards.delete(element)
      element = @deck.all_cards[rand(@deck.all_cards.length)]
      self.cards << element
      @deck.all_cards.delete(element)
    end
  end

  def move_of_dealer(score)
    if score <  15
      add_card(@deck)
      @message = 'dealer added card'
   elsif
      @message = 'dealer skips a move'
    end
  end
end
