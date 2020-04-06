# frozen_string_literal: true

require_relative('card.rb')

# Class for deck
class Deck
  attr_reader :deck

  def initialize
    @deck = []

    Card::CARD_SUITES.each do |suite|
      Card::CARD_VALUES.each do |value|
        @deck << Card.new(suite, value)
      end
    end
  end

  def card
    card_index = rand(@deck.size)
    @deck.delete_at(card_index)
  end
end
