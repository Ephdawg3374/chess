class Piece
  attr_reader :position, :color
  def initialize(position, board, color)
    @color = color
    @position = position
    @board = board
  end


  def x
    @position[0]
  end

  def y
    @position[1]
  end

  # def move(new_pos)
  #   @position = new_pos
  # end

  def moves
    possible_moves = self.class::POSSIBLE_DIRECTIONS.map do |x_offset, y_offset|
      [x + x_offset, y + y_offset]
    end
  end

  def to_s
    " "
  end
end
