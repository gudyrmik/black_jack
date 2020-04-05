require_relative('card.rb')

class Deck

  attr_reader :deck

  def initialize
    @deck = []
    card_suites = ['♦', '♥️', '♣', '♠']
    card_values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    card_suites.each do |suite|
      card_values.each do |value|
        @deck << Card.new(suite, value)
      end
    end
  end

  def get_card
    card_index = rand(@deck.size)
    @deck.delete_at(card_index)
  end
end