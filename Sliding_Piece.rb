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
      temp_x, temp_y = x, y
      while @board.in_bounds?([temp_x, temp_y])
        # temp_x < 0 || temp_x == @board.dimensions-1 ||
        #     temp_y < 0 || temp_y == @board.dimensions-1
        pos = [temp_x += x_offset, temp_y += y_offset]

        if @board.in_bounds?(pos) && check_piece_collision?(pos)
          if self.color == @board[pos].color
            possible_moves << pos
          end
          break
        end

        possible_moves << pos if @board.in_bounds?(pos)
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
