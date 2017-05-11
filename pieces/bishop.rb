require_relative 'piece'
class Bishop < Piece
  include SlidingPiece
  attr_reader :symbol

  def symbol
    color === :white ? "♗" : "♝"
    # :B.colorize(color)
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

end
