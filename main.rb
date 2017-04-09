require_relative 'player'
require_relative 'deck'
require_relative 'dealer'

class Game
  attr_reader :deck, :player, :dealer, :message_of_dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    @deck.create_cards
    give_out_cards
  end

  def give_out_cards
    2.times do
      element = @deck.all_cards[rand(@deck.all_cards.length)]
      @player.cards << element
      @deck.all_cards.delete(element)
      element = @deck.all_cards[rand(@deck.all_cards.length)]
      @dealer.cards << element
      @deck.all_cards.delete(element)
    end
  end

  def add_card(people)
    element = @deck.all_cards[rand(@deck.all_cards.length)]
    if people == 'player'
      @player.cards << element
      move_of_dealer
    elsif people == 'dealer'
      @dealer.cards << element
    end
    @deck.all_cards.delete(element)
  end

  def count_score(cards)
    @count = 0
    cards.each do |card|
      @count += 10 if card.length > 3 && card.length != 4
      @count += 1 if card.include?('Ace') && @count > 10
      @count += 11 if card.include?('Ace') && @count <= 10
      @count += card[0..-2].to_i
    end
    @count
  end

  def move_of_dealer
   count = count_score(@dealer.cards)
    if count <  15 && @dealer.methods.include?('add_card')
      add_card('dealer')
      @message_of_dealer = 'dealer added card'
      @dealer.methods.delete('add_card')
   elsif
     @message_of_dealer = 'dealer skips a move'
     @dealer.methods.delete('skip_a_move')
    end
  end

  def skip_a_move
    move_of_dealer
  end

  def open_all_cards
    dealer = count_score(@dealer.cards)
    player = count_score(@player.cards)
     if (dealer < player ||  dealer > 21) && player <= 21
       @player.bank += 20
       @dealer.bank -= 10
       puts 'YOU WIN  !!! +10$'
     elsif (dealer > player || player > 21) && dealer <= 21
       @dealer.bank += 20
       @player.bank -= 10
       puts 'YOU LOST !!! -10$'
     else
       puts 'No one wins !!! +0$'
       @dealer.bank += 10
       @player.bank += 10
     end
  end
end

puts ''
puts 'Hi !!! Today you visited the casino from "Ivan"'
puts 'here while there is only one game called'
puts '"Black Jack" or "Twenty-one" play and earn money !!! '
puts 'The game costs 10$'
puts '♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢'
puts '♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢'
puts ''

puts 'For game enter your name please (:'
name = gets.chomp
game = Game.new

game.player.bank -= 10
game.dealer.bank -= 10


cards_of_dealer = 'cards of dealer : **'
score_of_dealer = 'score of dealer :  '
your_score = "your score : #{game.count_score(game.player.cards)} "
your_bank = "your bank : #{game.player.bank}"
your_cards = "your cards : #{game.player.cards}"

while true
  puts cards_of_dealer
  puts score_of_dealer
  puts your_score
  puts your_bank
  puts your_cards
  puts ''
  puts '♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢'
  puts 'what do you want to do ???(write this)'
  puts 'Skip a move'
  puts 'Add card'
  puts 'Open all cards'
  puts '♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢'
  puts ''
  method = gets.chomp.gsub(' ','_')
  method.downcase!

  until game.player.methods.include?(method)
    puts 'try again(write your action) !!! '
    method = gets.chomp.gsub(' ','_')
    method.downcase!
  end

  if game.player.methods.include?(method) && method == 'add_card'
    game.send(method,'player')
    puts '$'* 80
    puts 'you take one card'
    puts '$'* 80
    cards_of_dealer = 'cards of dealer : ***' if game.message_of_dealer == 'dealer added card'
    puts  game.message_of_dealer
    your_score = "your score : #{game.count_score(game.player.cards)}"
    your_cards = "your cards : #{game.player.cards}"
    game.player.methods.delete(method)
  end

  if game.player.methods.include?(method) && method == 'skip_a_move'
    game.send(method)
    puts '$'* 80
    puts 'you skip a move'
    puts '$'* 80
    cards_of_dealer = 'cards of dealer : ***' if game.message_of_dealer == 'dealer added card'
    puts  game.message_of_dealer
    game.player.methods.delete(method)
  end

  if method == 'open_all_cards' || (game.player.cards.size == 3  && game.dealer.cards.size == 3)
    puts ''
    game.open_all_cards
    puts ''
    cards_of_dealer = "cards of dealer : #{game.dealer.cards}"
    score_of_dealer = "score of dealer : #{game.count_score(game.dealer.cards)}"
    puts '>' * 80
    puts cards_of_dealer
    puts score_of_dealer
    puts '<' * 80
    puts your_score
    puts your_bank
    puts your_cards
    puts '><' * 40
    puts "#{name},you want play second game?(yes/no)"
    answer = gets.chomp
    break if answer == 'no'
    if answer == 'yes'
      puts '♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢'

      game.player.bank -= 10
      game.dealer.bank -= 10
      game.player.cards = []
      game.dealer.cards = []
      game.player.methods = %w(skip_a_move add_card open_all_cards)
      game.dealer.methods = %w(skip_a_move add_card open_all_cards)

      game.deck.create_cards
      game.give_out_cards

      cards_of_dealer = 'cards of dealer : **'
      score_of_dealer = 'score of dealer :  '
      your_score = "your score : #{game.count_score(game.player.cards)} "
      your_bank = "your bank : #{game.player.bank}"
      your_cards = "your cards : #{game.player.cards}"
    end
  end
end
