require_relative 'validator'

module DiceGame

  class Dice
    EDGES = 6

    def initialize edges: EDGES
      @edges = edges
    end

    def to_s
      "Dice with #{@edges} edges"
    end

    def turn
      rand(1..@edges)
    end


  end

end
