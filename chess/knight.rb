require_relative 'piece.rb'

class Knight < Piece
  include SteppingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
    @symbol = :k
  end

  protected

  def move_diffs
    diffs = [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1],
    ]
  end
end
