require_relative 'piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(board, color, pos)
    @symbol = :P
    super
  end

  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end

  def moves
    pos_moves = []
    forward_steps.each do |delta|
      pos_moves << [delta[0] + pos[0], delta[1] + pos[1]]
    end
    pos_moves
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_steps
    if at_start_row?
        [[forward_dir * 2, 0], [forward_dir, 0]]
    else
        [[forward_dir, 0]]
    end
  end

  # def side_attacks
  # end
end
