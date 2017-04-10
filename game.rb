require_relative 'users'
require_relative 'player'
require_relative 'deck'
require_relative 'dealer'
require_relative 'score'

class Game
  BET = 10

  attr_reader :deck, :player, :dealer, :score

  def initialize
    @player = Player.new
    @deck = Deck.new
    @deck.create_cards
    @dealer = Dealer.new(@player, @deck)
    @score = Score.new
  end

  def add_card(people)
    if people == 'player'
      @player.add_card(@deck)
      move_of_dealer
    else
      @dealer.add_card(@deck)
    end
  end

  def move_of_dealer
    score = @score.count_score(dealer.cards)
    @dealer.move_of_dealer(score)
  end

  def skip_a_move
    move_of_dealer
  end

  def count_score(cards)
    @score.count_score(cards)
  end

  def open_all_cards
    dealer = @score.count_score(@dealer.cards)
    player = @score.count_score(@player.cards)
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

  def bet
    BET
  end
end
