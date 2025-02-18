# players.rb
# this file defines the Player class which handles the player inputs
class Player
  def initialize
    @occupied_cells = []
  end

  def handle_player_input
    loop do
      number = Integer(gets.chomp)

      if !(1..9).include?(number)
        puts "Invalid input! Please enter a number between 1 and 9"
      elsif @occupied_cells.include?(number)
        puts "Cell already occupied, pick another one"
        next
      end

      @occupied_cells.push(number)
      return number
    rescue ArgumentError
      puts "Invalid input! Please enter a valid number"
    end
  end

  def ai_opponent_choice; end
end
