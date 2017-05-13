require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

  def make_move(board)
    starting_pos, ending_pos = nil, nil

    until starting_pos && ending_pos
      display.render

      if starting_pos
        puts "#{name}'s turn (#{color})"
        puts "Select desired ending square"
        ending_pos = display.cursor.get_input
        display.reset! if ending_pos
      else
        puts "#{name}'s turn (#{color})"
        puts "Select desired piece to move"
        starting_pos = display.cursor.get_input
        display.reset! if starting_pos
      end
    end
    [starting_pos, ending_pos]
  end
end
