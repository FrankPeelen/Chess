require "../spec_helper"
require "../../lib/models/pieces"
require "../../lib/models/player"

describe Piece do
	let(:player) { Player.new("Frank") }
	subject(:piece) { Piece.new(player) }

	describe "#new" do
		it { expect(piece.owner).to equal(player) }
	end
end
