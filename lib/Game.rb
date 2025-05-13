# frozen_string_literal: true

require_relative 'Board'

class Game
  def initialize
    @players = ['', '']
    @board = Board.new
    @round = 0

    @colors = {
      'w' => '⚪', # w - white
      'r' => '🔴', # r - red
      'y' => '🟡', # y - yellow
      'b' => '🔵', # b - blue
      'o' => '🟠', # o - oragne
      'g' => '🟢', # g - green
      'p' => '🟣', # p - purple
      'c' => '🟤'  # c - chocolate (bcs 'b' is for blue)
    }
  end

  def start_game
    select_colors

    winner = nil
    @board.draw

    while winner.nil?
      play_round
      winner = @board.winner
      @board.draw
    end

    winner_id = (@round - 1) % 2 + 1
    winner_color = @colors[winner]
    puts (winner == '0' ? 'Draw!' : "The winner is P#{winner_id}-#{winner_color}")
  end

  private

  def select_colors
    @players = ['', '']
    input_color_for_player(0)
    input_color_for_player(1)
  end

  def input_color_for_player(id)
    until @colors.keys.include?(@players[id])
      puts "Select color for player #{id + 1}"
      @colors.each { |key, color| puts "#{key} - #{color}" }

      @players[id] = gets.chomp.downcase
    end
  end

  def play_round
    column_id = input_column(@round % 2) - 1
    color = @players[@round % 2]
    success = @board.put_color(column_id, color)
    @round += 1 if success
  end

  def input_column(player_id)
    column = 0

    until column.between?(1, 7)
      puts "Select column (player #{player_id + 1})"
      column = gets.chomp.to_i
    end

    column
  end
end
