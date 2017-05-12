require_relative 'piece'

class Pawn < Piece

  def symbol
    color === :white ? "♙" : "♟"
  end

  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end

  def moves
    forward_step + side_attacks
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_step
    forward_moves = []
    step_one  = [pos[0] + forward_dir, pos[1]]
    step_two = [pos[0] + forward_dir * 2, pos[1]]

    forward_moves << step_one if (board.empty?(step_one) && board.in_bounds?(step_one))
    return [] if forward_moves.empty?

    forward_moves << step_two if (at_start_row? && board.empty?(step_two))

    forward_moves

  end

  def side_attacks
    side_moves = []
    diagonal_directions = [[pos[0] + forward_dir, pos[1] + -1], [pos[0] + forward_dir, pos[1] + 1]]
    diagonal_directions.each do |step|
       side_moves << step if (board.in_bounds?(step) && (!board.empty?(step) && board[step].color != self.color))
    end
    side_moves
  end
end
