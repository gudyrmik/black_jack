require_relative('hand.rb')

class Player

  attr_accessor :name, :hand, :bank

  def initialize(name)
    @name = validate_name(name)
    @hand = Hand.new
    @bank = 100
  end

  def to_s
    "#{@name}, #{@hand.to_s}, #{@bank} credits"
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
