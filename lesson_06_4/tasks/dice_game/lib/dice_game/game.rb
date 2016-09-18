require_relative 'dice'
require_relative 'validations'

module DiceGame
  class Game

    include Validations

    DICES_AMOUNT = 2
    DICE_SIDES   = 6
    WIN_AMOUNT   = 0.25

    def initialize *users
      @users        = users
      @dices        = create_dices
      @game_credits = Hash.new { |hash, key| hash[key] = 0 }
      @print_buffer = []
    end

    def turn
      if valid_turn?
        turn_score = roll_dices
        @print_buffer.push "Wheel of fortune throws: #{turn_score}"
        @users.each { |user| resolve_turn(user, turn_score) }
        print_result
      else
        raise @error
      end
    end

    def finish
      result = []
      result.push "Game results:\n"

      @game_credits.each do |user, credits|
        result.push "#{user.name} earns #{credits} credits\n"
      end

      puts result
    end

    private

    def create_dices
      dices = Array.new(DICES_AMOUNT) # => [nil, nil]
      dices.map! { Dice.new(DICE_SIDES) }
    end

    def roll_dices
      @dices.inject(0) { |sum, dice| sum + dice.roll }
    end

    def resolve_turn user, turn_score
      result = if user.get_bet[:score] == turn_score
        user.credits += win_amount(user)
        @game_credits[user] += win_amount(user)
        "#{user.name} wins"
      else
        @game_credits[user] -= user.get_bet[:credits]
        user.credits -= user.get_bet[:credits]
        "#{user.name} loses"
      end

      @print_buffer.push result
    end

    def win_amount user
      user.get_bet[:credits] * WIN_AMOUNT
    end

    def print_result
      puts @print_buffer.join("\n")
      puts
      @print_buffer = []
    end

  end
end
