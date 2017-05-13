require "colorize"
require_relative "cursor"


class Display
  attr_reader :board, :cursor, :notifications
  attr_accessor :moves_queue
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
    @moves_queue = []
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if cursor.selected
      moves_queue.push(cursor.cursor_pos)
    else
      self.moves_queue = []
    end
    if cursor.cursor_pos && cursor.selected
      if (board[moves_queue.first].class != Null) && (board[moves_queue.first].moves.include?([i, j])) && moves_queue.first && ([i,j] != cursor.cursor_pos)
        bg = :light_yellow
      elsif [i, j] == moves_queue.first
        bg = :light_green
      elsif [i, j] == cursor.cursor_pos && moves_queue.first
        bg = :light_cyan
      elsif (i + j).odd?
        bg = :light_black
      else
        bg = :light_white
      end
    elsif [i, j] == cursor.cursor_pos && cursor.selected
      bg = :light_green
    elsif [i, j] == cursor.cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_black
    else
      bg = :light_white
    end
    { background: bg }
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    puts "   a  b  c  d  e  f  g  h "
    build_grid.each_with_index { |row, i| puts "#{board.grid.length - i} #{row.join} #{board.grid.length - i}" }
    puts "   a  b  c  d  e  f  g  h "
    puts ""
    @notifications.each do |key, val|
      puts "#{val}"
    end
    puts moves_queue.first
  end

  # def helper
  #   while true
  #     render
  #     cursor.get_input
  #     cursor.cursor_pos
  #   end
  # end

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
