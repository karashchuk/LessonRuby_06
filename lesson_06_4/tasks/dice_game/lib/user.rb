class User

  DEFAULT_CREDITS = 1_000

  attr_reader   :name
  attr_accessor :credits

  def initialize name
    @name    = name
    @credits = DEFAULT_CREDITS
    @bet     = {}
  end

  def bet score:, credits:
    @bet[:score]   = score
    @bet[:credits] = credits
  end

  def get_bet
    @bet
  end

  def to_s
    "I'm #{@name} with #{@credits} credits"
  end

end
