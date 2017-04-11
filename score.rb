module Score
  def self.count(cards)
    count = 0
    cards.each do |card|
      count += card_value(card[0..-2], count)
    end
    count
  end

  private

  def self.card_value(card, count)
    return 10 if ['Jack', 'Queen', 'King'].include? card
    return (count > 10) ? 1 : 11 if card == 'Ace'
    card.to_i
  end
end
