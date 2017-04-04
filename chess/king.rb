require_relative 'piece.rb'

class King  < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super(pos, board, color)
    @symbol = :k
  end

  protected

  def move_diffs
    DIAGONALS + HORIZONTALS
  end

end
