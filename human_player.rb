require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

  def make_move(board)
    starting_pos, ending_pos = nil, nil

    until starting_pos && ending_pos
      display.render
      padding = " " * 5

      if starting_pos
        puts "#{padding}#{name}'s turn (#{color})"
        puts "#{padding}Select desired ending position"
        ending_pos = display.cursor.get_input
        display.reset! if ending_pos
      else
        puts "#{padding}#{name}'s turn (#{color})"
        puts "#{padding}Select desired piece to move"
        starting_pos = display.cursor.get_input
        display.reset! if starting_pos
      end
    end
    [starting_pos, ending_pos]
  end
end
