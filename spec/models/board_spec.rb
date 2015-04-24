require "../spec_helper"
require "../../lib/models/board"
require "../../lib/models/player"
require "../../lib/models/pieces"

describe Board do
	let(:name1) { "Frank" }
	let(:name2) { "Kasparov" }
	let(:player1) { Player.new(name1) }
	let(:player2) { Player.new(name2) }
	subject(:board) { Board.new(player1, player2) }

	describe "#new" do
		let(:empty_rows_correct) {
			(3..6).each do |row_num|
				board.field[row_num - 1].each do |val|
					return false unless val == nil
				end
			end
			return true }
		let(:pawn_rows_correct) {
			board.field[1].each do |val|
				return false unless val.is_a?(Pawn) && val.owner == player1
			end
			board.field[6].each do |val|
				return false unless val.is_a?(Pawn) && val.owner == player2
			end
			return true }
		let(:back_rows_correct) {
			row1 = board.field[0]
			row8 = board.field[7]
			row1.each do |val|
				return false unless val.owner == player1
			end
			row8.each do |val|
				return false unless val.owner == player2
			end
			return false unless row1[0].is_a?(Rook) && row1[7].is_a?(Rook) && row8[0].is_a?(Rook) && row8[7].is_a?(Rook)
			return false unless row1[1].is_a?(Knight) && row1[6].is_a?(Knight) && row8[1].is_a?(Knight) && row8[6].is_a?(Knight)
			return false unless row1[2].is_a?(Bishop) && row1[5].is_a?(Bishop) && row8[2].is_a?(Bishop) && row8[5].is_a?(Bishop)
			return false unless row1[3].is_a?(Queen) && row8[3].is_a?(Queen)
			return false unless row1[4].is_a?(King) && row8[4].is_a?(King)
			return true }

		it { expect(board.field.size).to eql(8) }
		it { expect(empty_rows_correct).to be_true }
		it { expect(pawn_rows_correct).to be_true }
		it { expect(back_rows_correct).to be_true }
	end
end
