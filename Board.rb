class NoPieceError < StandardError
end

class MoveError < StandardError
end

class Board



  def initialize
    @dimensions = 8
    @grid = Array.new(@dimensions) { Array.new(@dimensions) }

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def move(start, end_pos)
    raise NoPieceError.new("Piece does not exist at #{start}") if self[start].nil?
    raise MoveError.new("Piece can not move to #{end_pos}") if self[start].moves.includes?(end_pos)
    self[end_pos] = self[start]
    self[start] = nil
    nil
  end

  def rows
    @grid
  end

end
