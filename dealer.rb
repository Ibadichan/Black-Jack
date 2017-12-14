class Dealer < User
  attr_accessor :bank, :cards, :message

  def initialize(player, deck)
    @bank = 100
    @cards = []
    @players = [player, self]
    @deck = deck
    give_out_cards
  end

  def give_out_cards
    @players.each { |player| 2.times { player.cards << @deck.give_a_card } }
  end

  def move_of_dealer
    if Score.count(cards) < 15
      add_card(@deck)
      @message = 'dealer added card'
    else
      @message = 'dealer skips a move'
    end
  end
end
