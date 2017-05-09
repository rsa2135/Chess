require_relative 'piece'
class Rook < Piece
  include SlidingPiece

  def symbol
    color === :white ? "\u2656" : "\u265C"
  end

  def move_dirs
    [[1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
