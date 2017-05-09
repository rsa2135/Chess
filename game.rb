require_relative HumanPlayer
require_relative Display
require_relative Board

class Game

  attr_accessor :current_player_color, :current_player_name, :board, :display, :players, :name

  def initialize
    @board = Board.new
    @display = Display.new(@board)

    @players = {
      white: HumanPlayer.new(:name, :white, @display)
      black: HumanPlayer.new(:name, :black, @display)
    }

    @current_player_color = :white
    @current_player_name = @players[:white].name

  end

  def play
    until board.checkmate?(current_player_color)
      begin
        start_pos, end_pos = players[current_player_color].make_move(board)
        board.move_piece(current_player_color, start_pos, end_pos)

        swap_turn!
        notify_players
      rescue StandardError => e
        @display.notifications[:error] = e.message
        retry
      end
    end
    display.render
    puts "#{current_player_name} is checkmated!"
  end

  private
  def notify_players()
    if board.in_check?(current_player_color)
      display.set_check!
    else
      display.uncheck!
    end
  end

  def swap_turn!
    @current_player_color = (current_player_color == :white) ? :black : :white
    @current_player_name =
      (current_player_color == :white) ? @players[:black].name : @players[:white].name
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
