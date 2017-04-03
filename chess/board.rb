require_relative 'piece.rb'

class Board
  attr_reader :board
  def initialize(board = empty_grid)
    @board = board
  end

  def empty_grid
    Array.new(8) { Array.new(8)}
  end

  def play

    begin
      start_pos = get.player_input
    rescue
      retry
    end
  end

  def populate
    [0,1,6,7].each do |x|
      @board.length.times do |y|
        @board[x][y] = Piece.new
      end
    end

    [2..5].each do |x|
      @board.length.times do |y|
        @board[x][y] = NullPiece.new
      end
    end

    @board
  end

  def move_piece(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      x,y = start_pos
      i,j = end_pos
      @board[x][y], @board[i][j] = @board[i][j], @board[x][y]
    end
  end

  def self.in_bounds?(pos)
    x, y = pos
    x.between?(0..7) && y.between?(0..7)
  end

  def valid_move?(start_pos, end_pos)
    raise "Not on board!" unless valid_position?(start_pos) ||
    valid_position?(end_pos)

    x,y = start_pos
    raise "Not piece" unless @board[x][y].is_a? Piece
    i,j = end_pos
    raise "Occupied" if @board[i][j].is_a? Piece
    true
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @board[x][y] = piece
  end

end

# load "board.rb"
# game = Board.new
# game.populate
# game.move_piece([1,1], [4,4])
