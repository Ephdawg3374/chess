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

  def to_s
    self.color == :b ? "\u265A".encode : "\u2654".encode
  end
end
