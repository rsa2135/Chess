require_relative 'slideable'
require_relative 'stepable'

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(board, color, pos)
    @color = color
    @board = board
    @pos = pos

    board.add_piece(self, pos)
  end

  # def to_s
  #   self.symbol.to_s
  # end

  def to_s
    " #{symbol} "
  end

  def empty?
    self.is_a?(Null) ? true : false
  end

  def symbol
    # subclass implements this with unicode chess char
    # raise NotImplementedError
  end

  def valid_moves
    # debugger
    valid_moves_arr = []
    moves_collection = moves
    moves_collection.each do |move|
      unless move_into_check?(move)
        valid_moves_arr.push(move)
      end
    end
    # debugger
    valid_moves_arr
  end

  private
  def move_into_check?(end_pos)
    # debugger
    duped_board = board.dup
    duped_board.move_piece!(pos, end_pos)
    duped_board.in_check?(color)
  end
end
