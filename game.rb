require_relative('player.rb')

# Object for game control and CLI
class Game

  attr_accessor :card_deck, :user_name, :game_bank

  def initialize
    @card_deck = []
    puts 'Welcome to Black Jack!'
    print 'Enter your name: '
    @user_name = gets.chomp
    @game_bank = 0
  end

  def run_new_game
    @user = UserPlayer.new(@user_name)
    @dealer = DealerPlayer.new
    init_card_deck
    deal_cards(@user)
    deal_cards(@dealer)
    make_bet(@user)
    make_bet(@dealer)

    loop do
      user_decision = users_turn
      break if user_decision == 3
    end
  end

  private

  def init_card_deck
    card_suites = ['♦', '♥️', '♣', '♠']
    card_costs = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    card_suites.each do |suite|
      card_costs.each do |cost|
        @card_deck << "#{cost}#{suite}"
      end
    end      
  end

  def deal_cards(player)
    player.cards << take_random_card
    player.cards << take_random_card
  end

  def make_bet(player)
    player.bank -= 10
    @game_bank += 10
  end

  def users_turn
    puts "Your score: #{@user.score}, cards: #{@user.cards}"
    puts '[1] Skip turn'
    puts '[2] Add card'
    puts '[3] Open cards'

    user_decision = gets.chomp.to_i
    case user_decision
    when 1
    when 2
      if @user.cards.size < 3
        @user.cards << take_random_card
      else
        puts 'You can\'t add more cards. Skipping your turn'
      end
    when 3
    end
    user_decision
  end

  def dealers_turn
    dealers_decision = 1 if @dealer.score >= 17
    dealers_decision = 2 if @dealer.score < 17 && @dealer.cards.size < 3
  end

  def take_random_card
    card_index = rand(card_deck.size)
    @card_deck.delete_at(card_index)
  end
end
