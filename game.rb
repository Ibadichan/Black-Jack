require_relative 'user'
require_relative 'player'
require_relative 'deck'
require_relative 'dealer'
require_relative 'score'

class Game
  BET = 10

  attr_reader :player, :dealer
  attr_accessor :deck

  def initialize
    @player = Player.new
    @deck = Deck.new
    @dealer = Dealer.new(@player, @deck)
  end

  def add_card(people)
    if people == 'player'
      @player.add_card(@deck)
      @dealer.move_of_dealer
    else
      @dealer.add_card(@deck)
    end
  end

  def skip_a_move
    @dealer.move_of_dealer
  end

  def count_score(cards)
    Score.count(cards)
  end

  def open_all_cards
    dealer = Score.count(@dealer.cards)
    player = Score.count(@player.cards)
     if (dealer < player ||  dealer > 21) && player <= 21
       @player.bank += BET * 2
       puts 'YOU WIN  !!! +10$'
     elsif (dealer > player || player > 21) && dealer <= 21
       @dealer.bank += BET * 2
       puts 'YOU LOST !!! -10$'
     else
       puts 'No one wins !!! +0$'
       @dealer.bank += BET
       @player.bank += BET
     end
  end
end
