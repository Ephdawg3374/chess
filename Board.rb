class NoPieceError < StandardError
end

class MoveError < StandardError
end

class Board
  attr_reader :dimensions, :grid

  def initialize
    @dimensions = 8
    @grid = Array.new(@dimensions) { Array.new(@dimensions) }
    populate_pawns(:b)
    populate_pawns(:w)
    populate_non_pawns(:b)
    populate_non_pawns(:w)
  end

  def [](pos)
    x, y = pos

    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def populate_pawns(color)
    color == :b ? row_indx = 6 : row_indx = 1

    self.grid.each do |row|
      row.each_index do |col_i|
        pos = [row_indx, col_i]

        self[pos] = Pawn.new(pos, self, color)
      end
    end
    nil
  end

  def populate_non_pawns(color)
    color == :b ? row_indx = 7 : row_indx = 0
    non_pawn_row = [
        Rook.new([row_indx, 0], self, color),
        Knight.new([row_indx, 1], self, color),
        Bishop.new([row_indx, 2], self, color),
        King.new([row_indx, 3], self, color),
        Queen.new([row_indx, 4], self, color),
        Bishop.new([row_indx, 5], self, color),
        Knight.new([row_indx, 6], self, color),
        Rook.new([row_indx, 7], self, color)
    ]

    self.grid[row_indx] = non_pawn_row
    nil
  end

  def in_check?(color)
    king_pos = nil

    rows.each_with_index do |row, row_num|
      found_king = row.find { |piece| piece.class == King && piece.color == color}
      king_pos = found_king.position if found_king
      break if king_pos
    end

    enemy_pieces = []

    rows.each do |row|
      row.each { |piece| enemy_pieces << piece if !piece.nil? && piece.color != color}
    end
    #p enemy_pieces
    enemy_pieces.any? do |piece|

      piece.valid_moves.include?(king_pos)
      # print "#{piece.valid_moves} #{piece.class}\n"
    end
  end

  def move(start, end_pos)
    raise NoPieceError.new("Piece does not exist at #{start}") if self[start].nil?
    raise MoveError.new("Piece can not move to #{end_pos}") if self[start].moves.includes?(end_pos)
    self[end_pos] = self[start]
    self[start] = nil
    nil
  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0, @dimensions - 1) && y.between?(0, @dimensions - 1)
  end

  def rows
    @grid
  end

end
