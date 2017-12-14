class Deck
  attr_accessor :cards

  def initialize
    card_numbers = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    @cards = []
    card_numbers.each { |card| @cards << "#{card}♥" << "#{card}♣" << "#{card}♠" << "#{card}♦" }
    @cards.shuffle!
  end

  def give_a_card
    @cards.pop
  end
end
