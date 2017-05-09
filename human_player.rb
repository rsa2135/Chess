require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

  def make_move(board)
    starting_pos, ending_pos = nil, nil

    until starting_pos && ending_pos
      display.render

      if starting_pos
        puts "#{name}'s (#{color}) turn. Where do you want to move?"
        ending_pos = display.cursor.get_input
        display.reset! if ending_pos
      else
        puts "#{name}'s (#{color}) turn. Where from do you want to move?"
        starting_pos = display.curose.get_input
        display.reset! if ending_pos
      end
    end

    [starting_pos, ending_pos]
  end
end
