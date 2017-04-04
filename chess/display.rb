require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
  #cursor = Cursor.new([0,0], board = Board.new)
  def initialize(board = Board.new)
    @board = board
    #@cursor = cursor 'Cursor.new([0,0], board)
  end

  def render
    header = (0..7).to_a.join(" ")
    p "  #{header}"
    @board.each_with_index { |row, i| display_row(row, i) }

   end

  def display_row(row, i)
    chars = row.map { |el| "#{el.symbol}" }.join("  ")
    p "#{i} #{chars}"
  end

end
