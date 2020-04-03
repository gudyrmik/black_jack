require_relative('player.rb')

# Object for game control and CLI
class Game

  attr_accessor :card_deck, :player_name

  def initialize
    @card_deck = []
    puts 'Welcome to Black Jack!'
    print 'Enter your name: '
    @player_name = gets.chomp.to_i
  end

  def run_new_game
    @user = UserPlayer.new(@player_name)
    @dealer = DealerPlayer.new
    fill_card_deck
    @user.cards << take_random_card
    @user.cards << take_random_card
    @dealer.cards << take_random_card
    @dealer.cards << take_random_card
  end

  private

  def fill_card_deck
    card_suites = ['♦', '♥️', '♣', '♠']
    card_costs = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    card_suites.each do |suite|
      card_costs.each do |cost|
        @card_deck << "#{cost}#{suite}"
      end
    end      
  end

  def take_random_card
    card_index = rand(card_deck.size)
    @card_deck.delete_at(card_index)
  end
end
