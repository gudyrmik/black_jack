# Object for game control
class Game

  attr_accessor :card_deck

  def initialize
    @card_deck = {}
  end

  def start_new_game
  end

  def fill_card_deck
    card_suites = ['♦', '♥️', '♣', '♠']
    card_costs = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    card_suites.each do |suite|
      card_costs.each do |cost|
        key = "#{cost}#{suite}"
        points = cost.to_i
        if points.zero?
          @card_deck[key] = 10
        else
          @card_deck[key] = points
        end
      end
    end      
  end

  def take_random_card

  end
end