require_relative "../models/player"
require_relative "../models/board"
require_relative "../models/pieces"

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

	def print_board
		7.downto(0).each do |row|
			print "\n#{row + 1}"
			@board.field[row].each do |piece|
				print " #{piece_to_output(piece).encode("utf-8")}"
			end			
		end
		print "\n  a  b  c  d  e  f  g  h"
	end

	def piece_to_output(piece)
		case
		when piece.is_a?(Pawn)
			return white?(piece) ? "\u2659" : "\u265f"
		when piece.is_a?(Rook)
			return white?(piece) ? "\u2656" : "\u265c"
		when piece.is_a?(Knight)
			return white?(piece) ? "\u2658" : "\u265e"
		when piece.is_a?(Bishop)
			return white?(piece) ? "\u2657" : "\u265d"
		when piece.is_a?(Queen)
			return white?(piece) ? "\u2655" : "\u265b"
		when piece.is_a?(King)
			return white?(piece) ? "\u2654" : "\u265a"
		else
			return "\u25ef"
		end
	end

	def white?(piece)
		piece.owner == @player1
	end
end
