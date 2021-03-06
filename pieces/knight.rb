require_relative 'piece'

class Knight < Piece
  include SteppingPiece

  def symbol
    color === :white ? "♘" : "♞"
  end

  def move_dirs
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

end
