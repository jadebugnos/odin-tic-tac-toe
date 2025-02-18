# board.rb
# this file defines the Board class which handles all the board logic for the game
class Board
  attr_accessor :combinations

  def initialize
    @blocks = Array.new(9, " ").each_slice(3).to_a # makes an array with 9 items then converts it to a 2D array
    @player_x_moves = []
    @player_y_moves = []
  end

  def create_blocks
    @blocks.flat_map do |sub_arr|
      sub_arr.map { |num| "|#{num}|" } # puts each items of the sub array inside | |
    end.each_slice(3).to_a # returns it back to a 2D array
  end

  def display_blocks
    create_blocks.each { |row| puts row.join(" ") }
  end

  # this method handles the displaying of X
  def update_board(choice)
    @blocks = @blocks.flatten.map.with_index do |item, index|
      if choice == index + 1
        @player_x_moves.push(choice)
        "X"
      else
        item
      end
    end.each_slice(3).to_a # converts the flattened array back to 2D array
  end
end
