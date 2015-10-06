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

  def move(new_pos)
    #reset old position
    @board[self.position] = nil
    #set new position
    @position = new_pos
    @board[new_pos] = self
  end

  def moves
    possible_moves = self.class::POSSIBLE_DIRECTIONS.map do |x_offset, y_offset|
      [x + x_offset, y + y_offset]
    end.select { |pos| @board.in_bounds?(pos) }
  end

  def to_s
    " "
  end

  def move_into_check?(pos) #==valid_moves
    new_board = @board.deep_dup
    new_board[@position] = nil
    new_board[pos] = self
    new_board.in_check?(self.color)
  end

  def valid_moves #== moves
    possible_moves = self.moves

    possible_moves.select! do |move|
      (@board[move].nil? || @board[move].color != self.color)
    end

      # @board[move].nil? || @board[move].color != self.color
    possible_moves
  end

end
