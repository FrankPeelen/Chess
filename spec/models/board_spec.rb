require "../spec_helper"
require "../../lib/models/board"
require "../../lib/models/player"

describe Board do
	let(:name1) { "Frank" }
	let(:name2) { "Kasparov" }
	let(:player1) { Player.new(name1) }
	let(:player2) { Player.new(name2) }
	subject(:board) { Board.new(player1, player2) }

	describe "#new" do
		let(:empty_row) {
			row = []
			8.times { row.push(nil) }
			row }
		let(:field) { [empty_row,
									 empty_row,
									 empty_row,
									 empty_row,
									 empty_row,
									 empty_row,
									 empty_row,
									 empty_row] }

		it { expect(board.field).to eql(field) }
	end
end
