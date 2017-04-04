require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super(pos, board, color)
    @symbol = :r
  end

  protected

  def move_dirs
    HORIZONTALS
  end

end
