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
    end.select { |pos| pos[0].between?(0, @board.dimensions-1) && pos[1].between?(0, @board.dimensions-1) }
  end

  def to_s
    " "
  end

  def valid_moves
    possible_moves = self.moves

    possible_moves.select! do |move|
      @board[move].nil? || @board[move].color != self.color
    end

      # @board[move].nil? || @board[move].color != self.color
    possible_moves
  end

end
