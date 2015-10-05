require_relative 'stepping_piece'

class King < SteppingPiece

  POSSIBLE_DIRECTIONS = [
                    [ 1,  0],
                    [ 0,  1],
                    [-1,  0],
                    [ 0, -1],
                    [ 1,  1],
                    [-1,  1],
                    [ 1, -1],
                    [-1, -1]
                    ]

  def initialize(position, board, color)
    super
  end

end
