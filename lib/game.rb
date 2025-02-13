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

  def run_game
    5.times do
      @choice = @player.handle_player_input
      @board.update_board(@choice)
      @board.display_blocks
    end
  end

  def check_winner
    
  end
end
