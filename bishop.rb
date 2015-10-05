class Bishop < SlidingPiece
  POSSIBLE_DIRECTIONS = [
                        [ 1,  1],
                        [ 1, -1],
                        [-1,  1],
                        [-1, -1]
                                ]

  def initialize(position, board, color)
    super
  end
end
