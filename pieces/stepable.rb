module SteppingPiece

  def moves
    deltas = move_dirs
    all_moves = grow_unblocked_moves_in_dir(pos, deltas)
  end

  def grow_unblocked_moves_in_dir(start_pos, deltas)
    current_moves = []
    deltas.each do |delta|
      new_pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
      next unless board.in_bounds?(new_pos)
      if board.empty?(new_pos)
        current_moves << new_pos
      elsif board[new_pos].color != self.color
        current_moves << new_pos
      end
    end
    current_moves
  end

end
