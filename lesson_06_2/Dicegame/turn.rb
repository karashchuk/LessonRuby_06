require_relative 'validator'
require_relative 'dice'
require_relative 'dicegame'
require_relative 'user'

module DiceGame
  include Validations

  class Turn
    attr_reader :k_win, :qty, :users

    def initialize(d_game:, dice:, k_win: 0.25)
      @k_win = k_win
      @qty = d_game.qty
      @users = d_game.users
      @dice = dice
    end

    def resolve
      if valid_bet?
        new_turn
      else
        puts error
      end
    end

    def new_turn
      points = 0
      (1..@qty).each {|x|points += @dice.turn}
      p "Wheel of fortune throws: #{points}"
      @users.each do |user|
        wins?(user,points)
      end
    end

    private

    def wins? user, points
      if user.score == points
        does = "wins"
        user.money += user.credits * (1 + @k_win)
      else
        does = "lost"
        user.money -= user.credits
      end
      p "User #{user.name} #{does} and has #{user.money}"
      user.score = 0
      user.credits = 0
    end

  end

end
