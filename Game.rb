require_relative 'display'
require_relative 'board'
require_relative 'piece'
require_relative 'king'
require_relative 'sliding_piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'queen'
require_relative 'pawn'
require_relative 'knight'

class Game

  def initialize(board)
    @board = board
  end

  def play
    display = Display.new(@board)
    display.render
    display.get_input

  end

  def won?
    false
  end

end

if $PROGRAM_NAME == __FILE__
  x = Board.new
  g = Game.new(x)
  g.play
end
