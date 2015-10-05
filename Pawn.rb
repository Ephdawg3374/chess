class Pawn < SteppingPiece
  POSSIBLE_DIRECTIONS = [
                    [ 1,  0],
                    [ 1,  1],
                    [ 1, -1]
                    ]

  def initialize(position, board, color)
    super
  end

  def moves
    poss_pos = Array.new

    if x == 1 && self.color == :w #whites on top
      poss_pos << [x+2, y]
      super + poss_pos
    elsif x == 6 && self.color == :b #blacks on bottom
      poss_pos << [x-2, y]
      super + poss_pos
    else #non first move
      super
    end
  end

  def to_s
    self.color == :b ? "\u265F".encode('utf-8') : "\u2659".encode('utf-8')
  end

end
