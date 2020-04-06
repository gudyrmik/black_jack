# frozen_string_literal: true

require_relative('hand.rb')

# Abstract class for Black Jack player
class Player
  attr_accessor :name, :hand, :bank

  def initialize(name)
    @name = validate_name(name)
    @hand = Hand.new
    @bank = 100
  end

  def to_s
    "#{@name}, #{@hand}, #{@bank} credits"
  end

  private

  NAME_REGEXP = /^[A-Z]{1}[a-z]+$/.freeze

  def validate_name(name)
    raise 'Invalid name' unless name =~ NAME_REGEXP

    name
  end
end

# Class for user-controlled Black Jack player
class UserPlayer < Player
  def initialize(name)
    super(name)
  end
end

# Class for dealer's Black Jack player
class DealerPlayer < Player
  def initialize
    super('Dealer')
  end
end
