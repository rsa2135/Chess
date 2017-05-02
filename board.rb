
require "byebug"
require_relative "display"
require_relative "pieces/piece"
require_relative "pieces/queen"
require_relative "pieces/knight"
require_relative "pieces/rook"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/pawn"
require_relative "pieces/null"

class Board
  PIECES = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  attr_accessor :grid, :display

  def build_board(populate)
    @grid = Array.new(8) { Array.new(8, Null.instance) }
    return unless populate
    self.populate
  end

  def initialize(populate = true)
    build_board(populate)
    @display = Display.new(self)
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def populate
    (0..7).each do |row|
      case row
      when 0, 7
        populate_back_row(row)
      when 1, 6
        populate_pawn(row)
      end
    end
  end

  def populate_back_row(row)
    PIECES.each_with_index do |piece, col|
      case row
      when 0
        color = :black
      else
        color = :white
      end
      piece.new(self, color, [row, col])
    end
  end

  def populate_pawn(row)
    (0..7).each do |col|
      case row
      when 1
        color = :black
      else
        color = :white
      end
      Pawn.new(self, color, [row, col])
    end
  end

  def populate_null(row)
    (0..7).each do |col|
      color = :brown
      self.grid[row] = Null.instance
    end
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise ArgumentError.new("Invalid starting position")
    elsif not in_bounds?(end_pos)
      raise ArgumentError.new("Invalid ending position")
    end
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = Null.instance
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def in_bounds?(pos)
    pos.all? { |coo| coo >= 0 && coo < 8 }
  end

  def in_check?(color)
    opposite_color = :white ? :black : :white
    king_pos = find_king_pos(color)
    grid.each do |row|
      row.each do |piece|
        if piece.color == opposite_color
          return true if piece.moves.include?(king_pos)
        end
      end
    end
    false
  end

  def checkmate?(color)
    opposite_color = :white ? :black : :white
    # king_pos = find_king_pos(color)
    grid.each do |row|
      row.each do |piece|
        if piece.color == opposite_color
          debugger
          return true if piece.valid_moves.empty?
        end
      end
    end
    false
  end

  def find_king_pos(color)
    grid.each do |row|
      row.each do |piece|
        return piece.pos if piece.color == color && piece.class == King
      end
    end
  end

  def existing_pieces
    grid.flatten.reject { |piece| piece.class == Null }
  end

  def dup
    board_copy = Board.new(false)

    existing_pieces.each do |piece|
      piece.class.new(board_copy, piece.color, piece.pos)
    end

    board_copy
  end
end


b = Board.new
# p b.class
# p b.grid
# b = Board.new
b.display.render
#
# b.dup
b.move_piece([6, 5], [5, 5])
b.move_piece([1, 4], [3, 4])
b.move_piece([6, 6], [4, 6])
b.move_piece([0, 3], [4, 7])
b.display.render
# b.move_piece([0,1], [2,0])
p b.in_check?(:white)
p b.checkmate?(:white)
# b.move_piece([2, 0], [4,1])
p
# p b.find_king_pos(:white)
# p b[[6, 0]].valid_moves
# puts "Knight: #{b[[5, 3]].valid_moves}"
# puts "Queen: #{b[[4, 3]].valid_moves}"
# puts "King: #{b[[0, 4]].valid_moves}"
# puts "Rook: #{b[[0, 0]].valid_moves}"
# puts "Bishop: #{b[[0, 5]].valid_moves}"
