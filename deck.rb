class Deck
  attr_accessor :all_cards

  def create_cards
    card_numbers = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    @all_cards = []
    card_numbers.each do |card|
      @all_cards << "#{card}♥" << "#{card}♣" << "#{card}♠" << "#{card}♦"
      end
  end
end