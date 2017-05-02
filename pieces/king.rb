require_relative 'piece'

class King < Piece
  include SteppingPiece
  attr_reader :symbol

  def initialize(board, color, pos)
    @symbol = :K
    super
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
