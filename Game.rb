require_relative 'display'
require_relative  'board'
if $PROGRAM_NAME == __FILE__
  x = Board.new
  y = Display.new(x)
  y.render
end


class Game

end
