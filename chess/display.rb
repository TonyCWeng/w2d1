require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
  def initialize(cursor = Cursor.new([0,0], board), board = Board.new)
    @board = board
    @cursor = cursor #Cursor.new([0,0], board)
  end

  def render
    header = (0..7).to_a.join(" ")
    p "  #{header}"
    @board.rows.each_with_index { |row, i| display_row(row, i) }
    @board[@cursor.cursor_pos].colorize(:red)
   end

  def display_row(row, i)
    chars = row.map { |el| "P" }.join("  ")
    p "#{i} #{chars}"
  end

end
