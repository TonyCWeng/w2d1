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

  def valid?
    moves = self.dup
    valids = []

    if color == :white
      moves.each do |spot|
        unless board[pos].is_a? NullPiece && board[pos].color == :white
          valids << spot
        end
      end
    end

    if color == :black
      moves.each do |spot|
        unless board[pos].is_a? NullPiece && board[pos].color == :black
          valids << spot
        end
      end
    end
    valids
  end

  def valid_moves
    #set of moves that place your king out of check/checkmate
    #needs to duplicate board to determine if a move would do so
    all_moves = self.dup
    all_moves.select {|move| move unless move_into_check?(end_pos)}
  end

  def move_into_check?(end_pos)
    scenario = board.deep_dup
    #deep dups and has the same set of pieces on board
    scenario.take_turn(end_pos)
    scenario.in_check?(color)
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
