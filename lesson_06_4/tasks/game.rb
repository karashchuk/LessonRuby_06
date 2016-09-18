require_relative 'dice_game/lib/dice_game'

fox    = User.new('Tricky Fox')
rabbit = User.new('Trustful Rabbit')

current_game = DiceGame.create fox, rabbit

fox.bet    score: 12, credits: 400
rabbit.bet score: 7,  credits: 350

current_game.turn

# => Wheel of fortune throws: 7
# => fox loses
# => rabbit wins

fox.bet    score: 6, credits: 100
rabbit.bet score: 11, credits: 300

current_game.turn

# => Wheel of fortune throws: 6
# => fox wins
# => rabbit loses

current_game.finish

# => Game results:
# => fox earns -375 credits
# => rabbit earns -212.5 credits
