# Abstract class for user-player and dealer-player
class Player

  attr_accessor :cards, :bank, :name

  def initialize(name)
    @name = validate_name(name)
    @cards = []
    @bank = 100
  end

  private

  NAME_REGEXP = /^[A-Z]{1}[a-z]+$/

  def validate_name(name)
    raise 'Invalid name' unless name =~ NAME_REGEXP
    name
  end
end

class User < Player
  def initialize(userName)
    super(userName)
  end
end

class Dealer < Player
  def initialize
    super('Dealer')
  end
end
