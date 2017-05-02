require_relative 'piece'
class Bishop < Piece
  include SlidingPiece
  attr_reader :symbol

  def initialize(board, color, pos)
    @symbol = :B
    super
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

end
