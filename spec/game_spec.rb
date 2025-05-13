require_relative '../lib/Game'

describe Game do
  subject(:game) { described_class.new }
  let(:board) { instance_double('Board') }

  before do
    game.instance_variable_set(:@board, board)
  end

  describe '#start_game' do
    context 'when user inputs red and yellow' do
      it 'selected colors are red and yellow' do
        allow(game).to receive(:puts)
        allow(game).to receive(:gets).and_return('dfdf', 'z', 'r', 'y')

        allow(game).to receive(:play_round)
        allow(board).to receive(:draw)
        allow(board).to receive(:winner).and_return('r')

        game.start_game

        players_colors = game.instance_variable_get(:@players)
        expect(players_colors).to eq(['r', 'y'])
      end
    end

    context 'when there is a winner' do
      it 'print the winner' do
        expect(game).to receive(:select_colors)

        expect(game).to receive(:play_round).twice
        expect(board).to receive(:winner).and_return(nil, 'b')
        expect(board).to receive(:draw).exactly(3).times

        expect(game).to receive(:puts).with('The winner is P2-🔵')

        game.start_game
      end
    end
  end
end
