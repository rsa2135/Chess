require_relative 'piece'

class Queen < Piece
  include SlidingPiece
  attr_reader :symbol

  def initialize(board, color, pos)
    @symbol = :Q
    super
  end



  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end

end
