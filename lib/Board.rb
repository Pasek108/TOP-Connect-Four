# frozen_string_literal: true

class Board
  def initialize
    @board = [
      %w[0 0 0 0 0 0 0],
      %w[0 0 0 0 0 0 0],
      %w[0 0 0 0 0 0 0],
      %w[0 0 0 0 0 0 0],
      %w[0 0 0 0 0 0 0],
      %w[0 0 0 0 0 0 0]
    ]
  end

  def winner
    return '0' unless @board.flatten.any? { |cell| cell == '0' }

    @board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        row_win = win_in_row?(i, j)
        col_win = win_in_col?(i, j)
        diag1_win = win_in_diag1?(i, j)
        diag2_win = win_in_diag2?(i, j)

        return cell if row_win || col_win || diag1_win || diag2_win
      end
    end

    nil
  end

  def put_color(column, color)
    if !column.between?(0, 7) || @board[0][column] != '0'
      puts 'You cant put color in this column'
      return false
    end

    for i in 5.downto(0) do
      if @board[i][column] == '0'
        @board[i][column] = color
        return true
      end
    end

    false
  end

  def draw
    colors = {
      '0' => '⚫', # 0 - black (means empty place)
      'w' => '⚪', # w - white
      'r' => '🔴', # r - red
      'y' => '🟡', # y - yellow
      'b' => '🔵', # b - blue
      'o' => '🟠', # o - oragne
      'g' => '🟢', # g - green
      'p' => '🟣', # p - purple
      'c' => '🟤'  # c - chocolate (bcs 'b' is for blue)
    }

    puts '１２３４５６７'
    @board.each do |row|
      row.each { |cell| print colors[cell] }
      puts ''
    end
  end

  private

  def win_in_row?(row, col)
    line = [
      get_board_cell(row - 1, col),
      get_board_cell(row - 0, col),
      get_board_cell(row + 1, col),
      get_board_cell(row + 2, col)
    ]

    has_nil_or_zero = line.any? { |cell| cell.nil? || cell == '0' }
    has_nil_or_zero ? false : line.all? { |cell| cell == line[0] }
  end

  def win_in_col?(row, col)
    line = [
      get_board_cell(row, col - 1),
      get_board_cell(row, col - 0),
      get_board_cell(row, col + 1),
      get_board_cell(row, col + 2)
    ]

    has_nil_or_zero = line.any? { |cell| cell.nil? || cell == '0' }
    has_nil_or_zero ? false : line.all? { |cell| cell == line[0] }
  end

  def win_in_diag1?(row, col)
    line = [
      get_board_cell(row - 1, col - 1),
      get_board_cell(row - 0, col - 0),
      get_board_cell(row + 1, col + 1),
      get_board_cell(row + 2, col + 2)
    ]

    has_nil_or_zero = line.any? { |cell| cell.nil? || cell == '0' }
    has_nil_or_zero ? false : line.all? { |cell| cell == line[0] }
  end

  def win_in_diag2?(row, col)
    line = [
      get_board_cell(row - 1, col + 1),
      get_board_cell(row + 0, col + 0),
      get_board_cell(row + 1, col - 1),
      get_board_cell(row + 2, col - 2)
    ]

    has_nil_or_zero = line.any? { |cell| cell.nil? || cell == '0' }
    has_nil_or_zero ? false : line.all? { |cell| cell == line[0] }
  end

  def get_board_cell(row, col)
    return nil if row < 0 || col < 0
    @board.dig(row, col)
  end
end
