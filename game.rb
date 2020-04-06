# frozen_string_literal: true

require_relative('player.rb')
require_relative('deck.rb')
require_relative('card.rb')

# Object for game control
class Game
  attr_accessor :user, :dealer, :deck, :game_bank

  def initialize(user, dealer)
    @user = user
    @dealer = dealer
  end

  def start_new_game
    @deck = Deck.new
    @game_bank = 0
    deal_cards(@user)
    deal_cards(@dealer)
    make_bet(@user)
    make_bet(@dealer)
  end

  def users_turn(decision)
    case decision
    when 1
      return 1
    when 2
      if @user.hand.cards.size < 3
        @user.hand.cards << @deck.card
        return 2
      else
        return -1
      end
    when 3
      return 3
    end
    -1
  end

  def dealers_turn
    return 1 if @dealer.hand.score >= 17 || @dealer.hand.cards.size == 3

    if @dealer.hand.score < 17 && @dealer.hand.cards.size < 3
      @dealer.hand.cards << @deck.card
      return 2
    end
    -1
  end

  def game_summary
    summary = '-----Game summary-----'
    if (@user.hand.score <= 21 && @user.hand.score > @dealer.hand.score) || (@user.hand.score <= 21 && @dealer.hand.score > 21)
      summary += "\n#{@user.name} wins and earns #{@game_bank} credits!"
      summary += "\n#{@dealer.name} loses."
      @user.bank += @game_bank
    end
    if (@user.hand.score > 21 && @dealer.hand.score > 21) || @user.hand.score == @dealer.hand.score
      summary += "\nTie! All bets are returned to players."
      @user.bank += @game_bank / 2
      @dealer.bank += @game_bank / 2
    end
    if @user.hand.score > 21 && @dealer.hand.score < 21
      summary += "\n#{@dealer.name} wins and earns #{@game_bank} credits!"
      summary += "\n#{@user.name} loses."
      @dealer.bank += @game_bank
    end
    summary += "\nPlayer: #{@user}"
    summary += "\nDealer: #{@dealer}"
    summary
  end

  private

  def deal_cards(player)
    player.hand.cards = []
    player.hand.cards << @deck.card
    player.hand.cards << @deck.card
  end

  def make_bet(player)
    player.bank -= 10
    @game_bank += 10
  end
end
