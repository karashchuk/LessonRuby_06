
#require_relative 'Dicegame/validator'
require_relative 'Dicegame/dice'
require_relative 'Dicegame/dicegame'
require_relative 'Dicegame/user'
require_relative 'Dicegame/turn'


include DiceGame
mydice = Dice.new
dg = Dicegame.new

u1 = User.new(name:"John",money:1000)
u2 = User.new(name:"Max",money:1000)
u3 = User.new(name:"Peter",money:500)

dg.create u1,u2,u3

u1.bet(score:4,credits:100)
u2.bet(score:5,credits:100)
u3.bet(score:6,credits:50)

turns=Turn.new(d_game:dg, dice:mydice)

turns.resolve

u1.bet(score:8,credits:100)
u2.bet(score:10,credits:100)
u3.bet(score:11,credits:50)

turns.resolve

dg.finish
