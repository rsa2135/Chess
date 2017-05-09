require_relative 'piece'

class Queen < Piece
  include SlidingPiece
  attr_reader :symbol

  def symbol
    color === :white ? "\u2655" : "\u265B"
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
