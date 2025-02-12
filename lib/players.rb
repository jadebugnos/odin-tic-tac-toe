class Player
  def handle_player_input
    loop do
      number = Integer(gets.chomp)
      return number if (1..9).include?(number)

      puts "Invalid input! Please enter a number between 1 and 9"
    rescue ArgumentError
      puts "Invalid input! please enter a valid number"
    end
  end

  def ai_opponent_choice
    
  end
end