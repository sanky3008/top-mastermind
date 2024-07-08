require_relative 'lib/game'
require_relative 'lib/code_maker'
require_relative 'lib/code_guesser'

game = Game.new(false, false)
game.play_game
