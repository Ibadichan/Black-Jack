class Deck
  attr_accessor :cards

  def initialize
    card_numbers = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    @cards = []
    card_numbers.each do |card|
      @cards << "#{card}♥" << "#{card}♣" << "#{card}♠" << "#{card}♦"
    end
    @cards.shuffle!
  end

  def give_a_card(index)
    @cards.delete_at(index)
  end
end
