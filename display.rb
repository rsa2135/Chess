require "colorize"
require_relative "cursor"
# require_relative "board"
require "byebug"
class Display
  attr_reader :grid, :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system("clear")
    puts "  #{("a".."h").to_a.join(" ")}"
    board.grid.each.with_index do |row, idx|
      print "#{8 - idx} "
      row.each_with_index do |piece, idy|
        if cursor.cursor_pos == [idx, idy]
          if cursor.selected
            print "#{piece.to_s.colorize(:blue)} "
          else
            print "#{piece.to_s.colorize(:red)} "
          end
        else
          print "#{piece.to_s.colorize(piece.color)} "
        end
      end
      puts
    end
  end

  def helper
    while true
      render
      cursor.get_input
      cursor.cursor_pos
    end
  end

  def reset!
    @notifications.delete(:error)
  end

  def uncheck!
    @notifications.delete(:check)
  end

  def set_check!
    @notifications[:check] = "Check!"
  end

end
