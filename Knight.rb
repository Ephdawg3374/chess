class Knight < SteppingPiece
  POSSIBLE_DIRECTIONS = [
                    [ 1,  2],
                    [ 1, -2],
                    [-1,  2],
                    [-1, -2],
                    [ 2,  1],
                    [ 2, -1],
                    [-2,  1],
                    [-2, -1]
                    ]

  def initialize(position, board, color)
    super
  end

end
