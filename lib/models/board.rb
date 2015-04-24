class Board
	attr_reader :field

	def initialize(player1, player2)
		empty_row = []
		8.times { empty_row.push(nil) }
		@field = []
		8.times { @field.push(empty_row) }
	end
end
