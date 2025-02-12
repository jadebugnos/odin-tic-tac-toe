class Game
  attr_reader :choice

  def initialize(choice = nil)
    @choice = choice
    @board = Board.new
  end

  def start_game
    puts "lets play Tic Tac Toe"
    @board.display_blocks
    loop_game
  end

  def loop_game
    5.times do
      @choice = handle_error
      @board.update_board(@choice)
      @board.display_blocks
    end
  end

  private

  def handle_error
    loop do
      number = Integer(gets.chomp)
      return number if (1..9).include?(number)

      puts "Invalid input! Please enter a number between 1 and 9"
    rescue ArgumentError
      puts "Invalid input! please enter a valid number"
    end
  end
end
