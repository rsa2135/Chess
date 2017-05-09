require_relative 'piece'

class King < Piece
  include SteppingPiece

  def symbol
    color === :white ? "\u2654" : "\u265A"
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
