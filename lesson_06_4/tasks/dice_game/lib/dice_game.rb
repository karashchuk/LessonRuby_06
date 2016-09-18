# https://gist.github.com/psylone/9c897e71cc5e70ae3f75#2-Игра-в-Кости

require_relative 'user'
require_relative 'dice_game/game'

module DiceGame

  VERSION = '1.0.0'

  def self.create *users
    Game.new *users
  end

  def self.version
    VERSION
  end

end
