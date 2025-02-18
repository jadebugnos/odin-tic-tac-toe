require_relative "rules"

# game.rb
# this file defines the Game class, which handles the game logic of the tic tac toe game
class Game
  include GameRules
  attr_reader :choice

  def initialize(board, player)
    @board = board
    @player = player
    @choice = nil
  end

  def start_game
    puts "lets play Tic Tac Toe"
    @board.display_blocks
    run_game
  end

  # this will run the game until a player won or the game is draw
  def run_game
    until game_state(@board.blocks)
      @choice = @player.handle_player_input
      @board.update_board(@choice)
      @board.display_blocks
    end
  end

  # checks if board has has the winning combination, the winning_combinations is a method in the GameRules module
  def check_winner(board, symbol)
    winning_combinations.any? do |combo|
      combo.all? { |index| board[index] == symbol }
    end
  end

  # this method will return true if a player has won or draw
  def game_state(board)
    board = board.flatten
    player_x = check_winner(board, "X")
    player_y = check_winner(board, "Y")
    draw = !board.include?(" ")

    player_x || player_y || draw
  end
end
