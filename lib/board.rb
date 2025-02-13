class Board
  attr_accessor :combinations

  def initialize
    @blocks = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @combinations = []
  end

  def create_blocks
    @blocks.flat_map do |sub_arr|
      sub_arr.map { |num| "|#{num}|" }
    end.each_slice(3).to_a
  end

  def display_blocks
    create_blocks.each { |row| puts row.join(" ") }
  end

  def update_board(choice)
    @blocks.flat_map do |row|
      row.map! do |block|
        if block == choice
          @combinations.push(block)
          "X"
        else
          block
        end
      end
    end
  end
end
