require_relative 'piece'

POSSIBLE_DIRECTIONS = [
                      [ 0, 1],
                      [ 1, 0],
                      [-1, 0],
                      [ 0,-1]
                              ]
class SlidingPiece < Piece
  def initialize(position, board, color)
    super
  end


  def moves
    possible_moves = []
    self.class::POSSIBLE_DIRECTIONS.each do |x_offset, y_offset|
      temp_x = x
      temp_y = y
      until temp_x < 0 || temp_x == @board.dimensions-1 ||
            temp_y < 0 || temp_y == @board.dimensions-1
        new_x, new_y = [temp_x += x_offset, temp_y += y_offset]
        pos = [new_x, new_y]

        if check_piece_collision?(pos)
          if self.color == @board[pos].color
            break
          else
            possible_moves << pos if new_x.between?(0, @board.dimensions-1) && new_y.between?(0, @board.dimensions-1)
            break
          end
        end
        possible_moves << pos if new_x.between?(0, @board.dimensions-1) && new_y.between?(0, @board.dimensions-1)
      end
    end
    possible_moves
  end

  def valid_moves
    self.moves
  end

  def check_piece_collision?(pos)
    !@board[pos].nil?
  end

end
