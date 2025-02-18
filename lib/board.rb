# board.rb
# this file defines the Board class which handles all the board logic for the game
class Board
  attr_accessor :combinations, :blocks

  def initialize
    @blocks = Array.new(9, " ").each_slice(3).to_a # makes an array with 9 items then converts it to a 2D array
    @player_moves = ["Y"] # use to check the last player who moved
  end

  def create_blocks
    @blocks.flat_map do |sub_arr|
      sub_arr.map { |num| "|#{num}|" } # puts each items of the sub array inside | |
    end.each_slice(3).to_a # returns it back to a 2D array
  end

  def display_blocks
    create_blocks.reverse.each { |row| puts row.join(" ") }
  end

  # this method updates the board in each turn
  def update_board(choice)
    @blocks = @blocks.flatten.map.with_index do |item, index|
      if choice == index + 1
        if @player_moves.last == "Y"
          @player_moves.push("X")
          puts "Player Y's turn"
          "X"
        else
          @player_moves.push("Y")
          puts "Player X's turn"
          "Y"
        end
      else
        item
      end
    end.each_slice(3).to_a # converts the flattened array back to 2D array
  end
end
