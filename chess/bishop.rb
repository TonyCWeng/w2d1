require_relative 'piece.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super(pos, board, color)
    @symbol = :b
  end

  protected

  def moves_dirs
    DIAGONALS
  end

end
