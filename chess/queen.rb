require_relative "piece.rb"

class Queen < Piece
  include SlidingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
    @symbol = :q
  end

  protected

  def move_dirs
    HORIZONTALS + DIAGONALS
  end

end
