require_relative 'piece'
class Rook < Piece
  include SlidingPiece
  attr_reader :symbol

  def initialize(board, color, pos)
    @symbol = :R
    super
  end

  def move_dirs
    [[1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
