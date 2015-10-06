require 'colorize'
require_relative 'cursorable'

class Display
  include Cursorable

  attr_reader :cursor_pos

  def initialize(board)
    @board = board
    @cursor_pos =  [0,0]

    @board[@cursor_pos].nil? ? @selected = false : @selected = true
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      if piece.nil?
        "   ".colorize(color_options)
      else
        (" "+piece.to_s+" ").colorize(color_options)
      end
    end
  end

  def colors_for(i, j)
    if [i,j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_white
    else
      bg = :light_blue
    end
    { background: bg }
  end

  def render
    #system("clear")
    build_grid.each { |row| puts row.join }
  end

end
