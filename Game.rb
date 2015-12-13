require_relative 'display'
require_relative 'board'
require_relative 'piece'
require_relative 'king'
require_relative 'sliding_piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'queen'
require_relative 'pawn'
require_relative 'blackpawn'
require_relative 'whitepawn'
require_relative 'knight'
require 'byebug'

class Game

  def initialize(board)
    @board = board
  end


  def select_position(display)
    puts "Select piece you want to move"
    result = nil
    until result
      display.render
      result = display.get_input
    end
    result
  end



  def play
    display = Display.new(@board)
    until won?
      start_pos = nil
      until !start_pos.nil? && !@board[start_pos].nil?
        select_position(display)
        start_pos = display.cursor_pos
      end

      end_pos = nil
      until !end_pos.nil? && @board[start_pos].valid_moves.include?(end_pos) #&& !@board[start_pos].move_into_check?(end_pos)
        select_position(display)
        end_pos = display.cursor_pos
      end

      @board[start_pos].move(end_pos)
    end
  end

  def won?
    false
  end

end
