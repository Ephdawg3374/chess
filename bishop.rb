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

  def to_s
    self.color == :b ? "\u265D".encode : "\u2657".encode
  end
end
