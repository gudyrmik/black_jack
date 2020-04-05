require_relative('player.rb')
require_relative('game.rb')

class CLI

  def initialize
    puts 'Welcome to Black Jack!'
    print 'Enter your name: '
    user_name = gets.chomp
    @game = Game.new(UserPlayer.new(user_name), DealerPlayer.new)

    loop do
      puts '[1] To play new game'
      puts '[2] To exit'

      case gets.chomp.to_i
      when 1
        game_cli
      when 2
        break
      end
    end
  end

  def game_cli
    @game.start_new_game
    loop do
      puts "#{@game.user.to_s}"
      puts '[1] Skip turn'
      puts '[2] Add card'
      puts '[3] Open cards'
      users_decision = @game.users_turn(gets.chomp.to_i)
      break if users_decision == 3 || (@game.user.hand.cards.size == 3 && @game.dealer.hand.cards.size == 3)
      @game.dealers_turn
    end
    puts @game.game_summary
  end
end