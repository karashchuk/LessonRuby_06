require_relative 'validator'
module DiceGame

  class User
    include Validations
    attr_accessor :name, :money, :score, :credits
    attr_reader :money_start
    def initialize name:"anonim", money:
      @name = name
      @money = money
      @money_start = money
      @score = 0
      @credits = 0
      @min = 2
      @max = 12
    end
    def to_s
      "User #{@name} with #{@money} $"
    end
    def bet score:,credits:
      if (valid_score? score) && (valid_credits? credits)
        @score = score
        @credits = credits
      else
        puts error
      end
    end

  end
end
