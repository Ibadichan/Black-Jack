class Score
  def count_score(cards)
    @count = 0
    cards.each do |card|
      card = card[0..-2] # выкидываю все ♠ ♤ ♥ ♡
      @count += 10 if card == 'Jack' || card == 'Queen' || card == 'King'
      @count += 1 if card == 'Ace' && @count > 10
      @count += 11 if card == 'Ace' && @count <= 10
      @count += card.to_i # если карта не картинка, преобразовываю к int и добавляю
    end
    @count
  end
end
