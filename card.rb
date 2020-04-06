# frozen_string_literal: true

# Class for card objects
class Card
  attr_reader :suite, :value

  CARD_SUITES = ['♦', '♥️', '♣', '♠'].freeze
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def to_s
    "#{suite}#{value}"
  end
end
