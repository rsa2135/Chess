require_relative HumanPlayer
require_relative Display
require_relative Board

class Game

  attr_accessor :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)

    @player1 = HumanPlayer.new("Ron")
    @player2 = HumanPlayer.new("Eli")
    @current_player = :white
  end

  def play
    until board.checkmate?(color)
  end

  private
  def notify_players()
  end

  def swap_turn!
    @current_player = (current_player == :white) ? :black : :white
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
