require_relative 'piece'

class Queen < Piece
  include SlidingPiece

  def symbol
    color === :white ? "♕" : "♛"
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
