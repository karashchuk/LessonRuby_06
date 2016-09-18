module DiceGame

  class GameTurnBetError < StandardError
    def message
      "Not all users made their bets"
    end
  end

  class DiceScoreBetError < StandardError
    def message
      "Bet has invalid score"
    end
  end

  class DiceCreditsBetError < StandardError
    def message
      "User has not enough credits"
    end
  end

  module Validations

    def valid_turn?
      @erorr = nil

      check_turn_bet
      check_bet_scores
      check_bet_credits

      @error.nil?
    end

    private

    def check_turn_bet
      return unless @error.nil?
      @error = GameTurnBetError unless @users.all? { |user| user.get_bet[:score] && user.get_bet[:credits] }
    end

    def check_bet_scores
      return unless @error.nil?
      @error = DiceScoreBetError unless @users.all? { |user| user.get_bet[:score].between? 1, Game::DICE_SIDES * Game::DICES_AMOUNT }
    end

    def check_bet_credits
      return unless @error.nil?
      @error = DiceCreditsBetError unless @users.all? { |user| user.credits >= user.get_bet[:credits] }
    end

  end
end
