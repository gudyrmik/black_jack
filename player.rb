# Abstract class for user-player and dealer-player
class Player

  attr_accessor :cards, :bank, :name

  def initialize(name)
    @name = validate_name(name)
    @cards = []
    @bank = 100
  end

  def score
    score = 0
    @cards.each do |card|
      next if card[0] == 'A'
      card_points = card.to_i
      card_points = 10 if card_points == 0
      score += card_points
    end
    @cards.each do |card|
      next unless card[0] == 'A'
        score += 1
        score += 10 if score + 10 <= 21
    end
    score
  end

  def to_s
    "#{@name}, #{score} points, #{@cards}, #{@bank} credits"
  end

  private

  NAME_REGEXP = /^[A-Z]{1}[a-z]+$/

  def validate_name(name)
    raise 'Invalid name' unless name =~ NAME_REGEXP
    name
  end
end

class UserPlayer < Player
  def initialize(userName)
    super(userName)
  end
end

class DealerPlayer < Player
  def initialize
    super('Dealer')
  end
end
