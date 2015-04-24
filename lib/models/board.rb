require_relative "pieces"

class Board
	attr_reader :field

	def initialize(player1, player2)
		@field = construct_empty_field(player1, player2)
	end

	private
	def construct_empty_field(player1, player2)
		empty_field = []
		empty_field.push(construct_row_1_8(player1))
		empty_field.push(construct_row_2_7(player1))
		4.times { empty_field.push(construct_empty_row) }
		empty_field.push(construct_row_2_7(player2))
		empty_field.push(construct_row_1_8(player2))
		empty_field
	end

	def construct_empty_row
		empty_row = []
		8.times { empty_row.push(nil) }
		empty_row
	end

	def construct_row_1_8(player)
		row = []
		row.push(Rook.new(player))
		row.push(Knight.new(player))
		row.push(Bishop.new(player))
		row.push(Queen.new(player))
		row.push(King.new(player))
		row.push(Bishop.new(player))
		row.push(Knight.new(player))
		row.push(Rook.new(player))
		row
	end

	def construct_row_2_7(player)
		row = []
		8.times { row.push(Pawn.new(player)) }
		row
	end
end
