module SteppingPiece

  def moves
    deltas = move_dirs
    all_moves = grow_unblocked_moves_in_dir(pos, deltas)
  end

  def grow_unblocked_moves_in_dir(start_pos, deltas)
    # debugger
    current_moves = []
    deltas.each do |delta|
      new_pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
      current_moves << new_pos if board.in_bounds?(new_pos) && board[new_pos].color != self.color
    end
    current_moves
  end

end
