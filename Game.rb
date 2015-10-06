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
require 'byebug'

class Game

  def initialize(board)
    @board = board
  end

  def play
    display = Display.new(@board)

    result = nil
    until result
      display.render
      result = display.get_input
    end
    result

  end

  def won?
    false
  end

end

if $PROGRAM_NAME == __FILE__
  x = Board.new
  pos = [3,4]
  x[pos] = Rook.new(pos, x, :w)
  x[[4,4]] = King.new([4,4], x, :b)
  x[[7, 3]] = nil
  p x.in_check?(:b)
  game = Game.new(x)
  #
  game.play
end
