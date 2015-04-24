require "./spec_helper"
require "./../lib/controllers/game"
require "./../lib/models/player"

describe Game do
	let(:player1_name) { "Frank" }
	let(:player2_name) { "Kasparov" }
	before { Game.any_instance.stub(:puts)
					 Game.any_instance.stub(:gets).and_return(player1_name, player2_name) }
	subject(:game) { Game.new }

	describe "#new" do
		it { expect(game.instance_variable_get(:@board)).not_to be_nil }
		it { expect(game.instance_variable_get(:@player1).name).to eql(player1_name) }
		it { expect(game.instance_variable_get(:@player2).name).to eql(player2_name) }
	end

end
