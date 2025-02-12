require_relative "lib/game"
require_relative "lib/board"
require_relative "lib/players"
require "rubocop"

board = Board.new
player = Player.new
new_game = Game.new(board, player)

new_game.start_game
