module SlidingPiece

  def moves
    deltas = move_dirs
    all_moves = []
    deltas.each do |delta|
      all_moves.concat(grow_unblocked_moves_in_dir(pos, delta))
    end
    all_moves
  end

  def grow_unblocked_moves_in_dir(start_pos, delta)
    captured = false
    current_moves = []
    new_pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
    while board.in_bounds?(new_pos) && board[new_pos].color != self.color
      if captured == true
        break
      end
      current_moves << new_pos
      board[new_pos].class != Null ? captured = true : captured = false
      new_pos = [current_moves.last[0] + delta[0], current_moves.last[1] + delta[1]]
    end
    current_moves
  end

end
