require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

  def make_move(board)
    starting_pos, ending_pos = nil, nil

    until starting_pos && ending_pos
      display.render
        
      if starting_pos
        puts "#{name}'s turn (#{color}). Where do you want to move?"
        ending_pos = display.cursor.get_input
        display.reset! if ending_pos
      else
        puts "#{name}'s turn (#{color}). Where from do you want to move?"
        starting_pos = display.cursor.get_input
        display.reset! if starting_pos
      end
    end
    # debugger
    [starting_pos, ending_pos]
  end
end
