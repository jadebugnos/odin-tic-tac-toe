require_relative "lib/game"
require_relative "lib/board"
require_relative "lib/players"
require "rubocop"

restart = ""

until restart == "n"
  board = Board.new
  player = Player.new
  new_game = Game.new(board, player)
  new_game.start_game

  loop do
    puts "Do you want to play again? y/n"
    restart = gets.chomp.downcase

    raise "Invalid input! Please enter 'y or n" unless %w[y n].include?(restart)

    break
  rescue StandardError => e
    puts e.message
  end
end
