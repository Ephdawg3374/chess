require_relative 'sliding_Piece'

class Rook < SlidingPiece

  POSSIBLE_DIRECTIONS = [
                        [ 0, 1],
                        [ 1, 0],
                        [-1, 0],
                        [ 0,-1]
                                ]

  def initialize(position, board, color)
    super
  end

end
