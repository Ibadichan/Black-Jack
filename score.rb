module Score
  def self.count(cards)
    count = 0
    cards.each { |card| count += card_value(card[0..-2], count) }
    count
  end

  def self.card_value(card, count)
    return 10 if %w[Jack Queen King].include? card
    return count > 10 ? 1 : 11 if card == 'Ace'
    card.to_i
  end

  private_class_method :card_value
end
