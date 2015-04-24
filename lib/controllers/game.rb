require_relative "../models/player"
require_relative "../models/board"

class Game
	def initialize
		@player1 = new_player(1)
		@player2 = new_player(2)
		@board = Board.new(@player1, @player2)
	end

	private
	def new_player(num)
		puts "Please enter player#{num}'s name:"
		player = Player.new(gets.chomp)
		puts "Welcome to the game #{player.name}!"
		player
	end
end
