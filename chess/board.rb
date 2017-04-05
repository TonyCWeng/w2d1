require_relative 'pieces'
require "byebug"

class Board
  attr_reader :board
  def initialize(board = empty_grid)
    @board = board
    populate
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
    debugger
    self[[0,0]] = Rook.new([0,0], board, :white)
    self[[0,1]] = Knight.new([0,1], board, :white)
    self[[0,2]] = Bishop.new([0,2], board, :white)
    self[[0,3]] = Queen.new([0,3], board, :white)
    self[[0,4]] = King.new([0,4], board, :white)
    self[[0,5]] = Bishop.new([0,5], board, :white)
    self[[0,6]] = Knight.new([0,6], board, :white)
    self[[0,7]] = Rook.new([0,7], board, :white)

    [1].each do |x|
      board.length.times do |y|
        board[x][y] = Pawn.new([x, y], board, :white)
      end
    end

    [6].each do |x|
      board.length.times do |y|
        board[x][y] = Pawn.new([x, y], board, :black)
      end
    end

    # @board[6].each_index do |idx|
    #   @board[[6, idx]] = Pawn.new([6, idx], board, :black)
    # end
    self[[7,0]] = Rook.new([7,0], board, :black)
    self[[7,1]] = Knight.new([7,1], board, :black)
    self[[7,2]] = Bishop.new([7,2], board, :black)
    self[[7,3]] = Queen.new([7,3], board, :black)
    self[[7,4]] = King.new([7,4], board, :black)
    self[[7,5]] = Bishop.new([7,5], board, :black)
    self[[7,6]] = Knight.new([7,6], board, :black)
    self[[7,7]] = Rook.new([7,7], board, :black)

    (2..5).each do |x|
      board.length.times do |y|
        board[x][y] = NullPiece.instance
      end
    end
  end

  def move_piece(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def in_bounds?(pos)
    pos.all? {|el| el.between?(0,7) }
  end

  def valid_move?(start_pos, end_pos)
    #raise "Not on board!" unless valid_position?(start_pos) ||
    #valid_position?(end_pos)

    raise "Not piece" if self[start_pos].is_a? NullPiece
    raise "Occupied" if self[end_pos].is_a? Piece
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

  def cols
    @board.transpose
  end

  def in_check?(color)
    kings_pos = nil
    (0..7).each do |row|
      (0..7).each do |col|
        if board[[row,col]].is_a? King &&  board[[row,col]].color == color
          kings_pos = [row,col]
        end
      end
    end

    enemies = board.flatten.select { |el| el unless el.color == color }
    enemies.each do |enemy|
      enemy.moves.each do |move|
        return true if move == kings_pos
      end
    end
    false
  end

  def checkmate?(color)
    color.in_check? && valid_moves.length == 0
  end


end

# load "board.rb"
# game = Board.new
# game.populate
# game.move_piece([1,1], [4,4])
