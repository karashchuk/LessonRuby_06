require_relative 'validator'
require_relative 'user'

module DiceGame

  class Dicegame
    include Validations
    QUANTITY = 2

    attr_reader :users, :qty

    def initialize
      @qty = QUANTITY
    end

    def to_s
      "Dicegame with #{@qty} dices"
    end

    def create *args
      @users = []
      args.each {|i| @users.push(i) if validuser? i }
      p "Game starts. In this game:"
      @users.each {|user| puts user}
    end


    def finish
      p "Game finished"
      @users.each do |user|
        difference = user.money - user.money_start
        does = "earns"
        if difference < 0
          does = "loses"
          difference = - difference
        end
        p "User #{user.name} #{does} #{difference} and has #{user.money}"
      end
      @users = nil
    end

  end

end

# include DiceGame
# dg=Dicegame.new
# puts dg
# u1 = User.new(name:"John",money:1000)
# u2 = User.new(name:"Max",money:1000)
#
# dg.create u1,u2,45
# u1.bet(score:4,credits:100)
# u2.bet(score:5,credits:100)
# dg.finish
