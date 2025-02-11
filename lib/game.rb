class Game
  attr_reader :choice

  def initialize(choice = nil)
    @choice = choice
  end

  def start_game
    puts "lets play Tic Tac Toe"
    @choice = self.handle_error
  end

  private
  def handle_error
    loop do
      begin
        number = Integer(gets.chomp)
        return number if (1..9).include?(number)
        puts "Invalid input! Please enter a number between 1 and 9"
      rescue ArgumentError
        puts "Invalid input! please enter a valid number"
      end
    end
  end
end