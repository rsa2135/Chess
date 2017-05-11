require "colorize"
require_relative "cursor"


class Display
  attr_reader :board, :cursor, :notifications
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
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
    # debugger
    if [i, j] == cursor.cursor_pos && cursor.selected
      bg = :light_green
      board[[i, j]].valid_moves.each do |move|
        bg = :light_yellow
      end
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
    build_grid.each { |row| puts row.join }

    @notifications.each do |key, val|
      puts "#{val}"
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
