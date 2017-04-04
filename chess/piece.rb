require_relative "board.rb"

class Piece
  attr_reader :symbol, :color
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
    @symbol = nil
  end

  def to_s
    "#{symbol}"
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_moves

  end

end

module SlidingPiece
  DIAGONALS = [
    [-1,1],
    [1,1],
    [1,-1],
    [-1,-1]
  ]

  HORIZONTALS = [
    [-1,0],
    [1,0],
    [0,1],
    [0,-1]
  ]

  def moves
    all_valid_moves = []
    move_dirs.each do |dx, dy|
      all_valid_moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    all_valid_moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    possible_moves = []
    while true
      new_position = @pos.dup
      new_position[0] += dx
      new_position[1] += dy
      if valid_move?(@pos, new_position)
        possible_moves << new_position
      else
        break
      end
    end
    possible_moves
  end

end

module SteppingPiece
  DIAGONALS = [
    [-1,1],
    [1,1],
    [1,-1],
    [-1,-1]
  ]

  HORIZONTALS = [
    [-1,0],
    [1,0],
    [0,1],
    [0,-1]
  ]

  def moves
    all_valid_moves = []
    move_diffs.each do |dx, dy|
      new_position = @pos.dup
      new_position[0] += dx
      new_position[1] += dy
      all_valid_moves << new_position if valid_move?(@pos, new_position)
    end
    all_valid_moves
  end

end
