class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def to_s
    str = '['
    @cards.each { |card| str += " #{card.to_s} " }
    str += "], score: #{score}"
  end

  def score
    score = 0
    @cards.each do |card|
      next if card.value == 'A'
      card_points = card.value.to_i
      card_points = 10 if card_points == 0
      score += card_points
    end
    @cards.each do |card|
      next unless card.value == 'A'
        score += 1
        score += 10 if score + 10 <= 21
    end
    return score
  end
end