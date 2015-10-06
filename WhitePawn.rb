require_relative 'pawn'

class WhitePawn < Pawn
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
    if x == 1 # first move
      poss_pos << [x + 2, y]
      poss_pos += super
    else #non first move
      poss_pos += super
    end

    poss_pos

  end

end
