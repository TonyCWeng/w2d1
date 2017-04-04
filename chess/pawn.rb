require_relative "piece.rb"

class Pawn < Piece
  attr_reader :color, :symbol

  def initialize(pos, board, color)
    super(pos, board, color)
    @symbol = :p
  end

  def forward_dir
    [0,1]
  end

  def forward_steps
    [0,2]
  end

  def moves
    if at_start_row?
      forward_dir = forward_dir + forward_steps
    end

    potential_moves = []
    forward_dir.each do |dx, dy|
      new_position = @pos.dup
      new_position[0] += dx
      new_position[1] += dy
      potential_moves << new_position if valid_move?(@pos, new_position)
    end

    potential_moves
  end

  def at_start_row?
    if color == :white && pos[0] == 1
      true
    elsif color == :black && pos[0] == 6
      true
    else
      false
    end
  end

  def side_attacks
    w_attacks = [[1,-1], [1,1]]
    b_attacks = [[-1,-1], [-1,1]]
    if color == :white
    end
    if color == :black
    end
  end
end
