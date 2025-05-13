# frozen_string_literal: true

require_relative '../lib/Board'

describe Board do
  describe '#initialize' do
    subject(:game_board) { described_class.new }

    it 'creates 7x6 board' do
      board_rows = game_board.instance_variable_get(:@board).length
      board_cols = game_board.instance_variable_get(:@board)[0].length
      expect(board_rows).to eq(6)
      expect(board_cols).to eq(7)
    end
  end

  describe '#winner' do
    subject(:game_board) { described_class.new }

    context 'when there is no winner' do
      it 'returns nil' do
        game_board.instance_variable_set(:@board, [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 r 0 0],
          %w[0 0 r r y 0 0],
          %w[y r y y y r 0]
        ])

        winer = game_board.winner
        expect(winer).to eq(nil)
      end
    end

    context 'when there is no possible moves' do
      it 'returns 0' do
        game_board.instance_variable_set(:@board, [
          %w[r y r y r y r],
          %w[r y r y r y r],
          %w[r y r y r y r],
          %w[y r y r y r y],
          %w[y r y r y r y],
          %w[y r y r y r y]
        ])

        winer = game_board.winner
        expect(winer).to eq('0')
      end
    end

    context 'when there is winner "y" in row' do
      it 'returns y' do
        game_board.instance_variable_set(:@board, [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 r 0 0],
          %w[0 0 r r y 0 0],
          %w[y r y y y y r]
        ])

        winer = game_board.winner
        expect(winer).to eq('y')
      end
    end

    context 'when there is winner "y" in column' do
      it 'returns y' do
        game_board.instance_variable_set(:@board, [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 y 0 0],
          %w[0 0 0 0 y 0 0],
          %w[0 0 r r y r 0],
          %w[y r y y y r r]
        ])

        winer = game_board.winner
        expect(winer).to eq('y')
      end
    end

    context 'when there is winner "r" in diag1' do
      it 'returns r' do
        game_board.instance_variable_set(:@board, [
          %w[0 0 0 0 0 0 0],
          %w[r 0 0 0 0 0 0],
          %w[y r 0 0 0 r 0],
          %w[r y r y y y 0],
          %w[y y r r y y 0],
          %w[y r r y y r 0]
        ])

        winer = game_board.winner
        expect(winer).to eq('r')
      end
    end

    context 'when there is winner "r" in diag2' do
      it 'returns r' do
        game_board.instance_variable_set(:@board, [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 r 0],
          %w[0 0 0 0 r y 0],
          %w[0 0 r r y y 0],
          %w[y r r y y r 0]
        ])

        winer = game_board.winner
        expect(winer).to eq('r')
      end
    end
  end

  describe '#put_color' do
    subject(:game_board) { described_class.new }

    context 'put color in empty column' do
      it 'returns board with color on bottom' do
        game_board.put_color(1, 'r')
        board = game_board.instance_variable_get(:@board)
        expect(board[5][1]).to eq('r')
      end
    end

    context 'put color in not empty column' do
      it 'returns board with color on the lowest empty place' do
        game_board.instance_variable_set(:@board, [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0]
        ])

        game_board.put_color(1, 'r')
        board = game_board.instance_variable_get(:@board)
        expect(board[3][1]).to eq('r')
      end
    end

    context 'put color in full column' do
      it 'prints error message' do
        game_board.instance_variable_set(:@board, [
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0],
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0],
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0]
        ])

        error_message = 'You cant put color in this column'
        expect(game_board).to receive(:puts).with(error_message)
        game_board.put_color(1, 'r')
      end
    end

    context 'put color in non existent column' do
      it 'prints error message' do
        game_board.instance_variable_set(:@board, [
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0],
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0],
          %w[0 y 0 0 0 0 0],
          %w[0 r 0 0 0 0 0]
        ])

        error_message = 'You cant put color in this column'
        expect(game_board).to receive(:puts).with(error_message)
        game_board.put_color(10, 'r')
      end
    end
  end
end
