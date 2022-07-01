# frozen_string_literal: true

# game grid class
class Board
  attr_reader :game_board

  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_game_board
    puts <<-BOARD

       #{@game_board[0]} | #{@game_board[1]} | #{@game_board[2]}
      -----------
       #{@game_board[3]} | #{@game_board[4]} | #{@game_board[5]}
      -----------
       #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]}

    BOARD
  end

  def field_available?(field)
    @game_board[field - 1].is_a?(Integer)
  end

  def board_full?
    @game_board.all? { |field| field.is_a?(String) }
  end

  def place_symbol(position, symbol)
    @game_board[position - 1] = symbol
  end

  def game_over?(symbol)
    WINNING_COMBINATIONS.any? do |combo|
      combo.all? { |field| @game_board[field - 1] == symbol }
    end
  end
end
