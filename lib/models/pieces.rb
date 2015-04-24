class Piece
	attr_accessor :owner

	def initialize(player)
		@owner = player
	end
end

class Pawn < Piece

end

class Rook < Piece

end

class Knight < Piece

end

class Bishop < Piece

end

class Queen < Piece

end

class King < Piece

end
