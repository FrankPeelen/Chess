require "../spec_helper"
require "../../lib/models/player"

describe Player do
	let(:name) { "Frank" }
	subject(:player) { Player.new(name) }

	describe "#new" do
		it { expect(player.name).to eql(name) }
	end
end
