# board.rb
# this file defines the Board class which handles all the board logic for the game
class Board
  attr_accessor :combinations

  def initialize
    @blocks = Array.new(9, " ").each_slice(3).to_a # board blocks
    @combinations = []
  end

  def create_blocks
    @blocks.flat_map do |sub_arr|
      sub_arr.map { |num| "|#{num}|" } # puts each items of the sub array inside | |
    end.each_slice(3).to_a # returns it back to a 2D array
  end

  def display_blocks
    create_blocks.each { |row| puts row.join(" ") }
  end

  def update_board(choice)
    # @blocks.flat_map do |row|
    #   row.map! do |block|
    #     if block == choice
    #       @combinations.push(choice) # collects the selected block for comparison
    #       "X"
    #     else
    #       block
    #     end
    #   end
    # end
    @blocks = @blocks.flatten.map.with_index do |item, index|
      if choice == index + 1
        @combinations.push(choice)
        "X"
      else
        item
      end
    end.each_slice(3).to_a
  end
end
