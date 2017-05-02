require_relative 'piece'

class Knight < Piece
  include SteppingPiece
  attr_reader :symbol

  def initialize(board, color, pos)
    @symbol = :N
    super
  end

  def move_dirs
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

end
