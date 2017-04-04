class Piece
  def initialize
    @piece = true
  end
end

module SlidingPiece

  def moves

  end
end

module SteepingPiece
  def moves

  end
end


class NullPiece < Piece
  include Singleton
  def initialize
    @piece = nil
  end
end
