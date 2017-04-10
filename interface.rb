require_relative 'game'

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

game.player.bank -= game.bet
game.dealer.bank -= game.bet

cards_of_dealer = 'cards of dealer : **'
score_of_dealer = 'score of dealer :  '
your_score = "your score : #{game.score.count_score(game.player.cards)} "
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
    cards_of_dealer = 'cards of dealer : ***' if game.dealer.message == 'dealer added card'
    puts  game.dealer.message
    your_score = "your score : #{game.score.count_score(game.player.cards)}"
    your_cards = "your cards : #{game.player.cards}"
    game.player.methods.delete(method)
  end

  if game.player.methods.include?(method) && method == 'skip_a_move'
    game.send(method)
    puts '$'* 80
    puts 'you skip a move'
    puts '$'* 80
    cards_of_dealer = 'cards of dealer : ***' if game.dealer.message == 'dealer added card'
    puts  game.dealer.message
    game.player.methods.delete(method)
  end

  if method == 'open_all_cards' || (game.player.cards.size == 3  && game.dealer.cards.size == 3)
    puts ''
    game.open_all_cards
    puts ''
    cards_of_dealer = "cards of dealer : #{game.dealer.cards}"
    score_of_dealer = "score of dealer : #{game.score.count_score(game.dealer.cards)}"
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

    if answer == 'yes'
      puts '♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢ ♠ ♤ ♥ ♡ ♣ ♧ ♦ ♢'

      game.player.bank -= game.bet
      game.dealer.bank -= game.bet
      game.player.cards = []
      game.dealer.cards = []
      game.player.methods = %w(skip_a_move add_card open_all_cards)

      game.deck.create_cards
      game.dealer.give_out_cards

      cards_of_dealer = 'cards of dealer : **'
      score_of_dealer = 'score of dealer :  '
      your_score = "your score : #{game.score.count_score(game.player.cards)} "
      your_bank = "your bank : #{game.player.bank}"
      your_cards = "your cards : #{game.player.cards}"
    else
      break
    end
  end
end
