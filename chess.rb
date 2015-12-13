require_relative 'board'
require_relative 'game'

if $PROGRAM_NAME == __FILE__
  board = Board.new
  game = Game.new(board)
  game.play
end
