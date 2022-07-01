# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# main game class
class Game
  attr_reader :board, :player1, :player2

  def initialize
    puts 'Welcome to Tic Tac Toe! Player 1 has symbol X, Player 2 has symbol O.'
    @board = Board.new
    puts 'Player 1, please enter your name:'
    @player1 = Player.new(gets.chomp, 'X')
    puts 'Player 2, please enter your name:'
    @player2 = Player.new(gets.chomp, 'O')
  end

  def play
    @board.display_game_board
    loop do
      player1_turn
      @board.display_game_board
      break if result

      player2_turn
      @board.display_game_board
      break if result
    end
    play_again?
  end

  private

  def player1_turn
    puts "#{@player1.name}, please choose an available number between 1 and 9 to place your symbol 'X':"
    field = gets.chomp.to_i
    until @player1.player_input_valid?(field) && @board.field_available?(field)
      puts 'Invalid selection. Please enter a number between 1 and 9:'
      field = gets.chomp.to_i
    end
    @board.place_symbol(field, 'X')
  end

  def player2_turn
    puts "#{@player2.name}, please choose an available number between 1 and 9 to place your symbol 'O':"
    field = gets.chomp.to_i
    until @player2.player_input_valid?(field) && @board.field_available?(field)
      puts 'Invalid selection. Please enter a number between 1 and 9:'
      field = gets.chomp.to_i
    end
    @board.place_symbol(field, 'O')
  end

  def result
    if @board.game_over?(@player1.symbol)
      puts "#{player1.name} wins!"
      true
    elsif @board.game_over?(@player2.symbol)
      puts "#{player2.name} wins!"
      true
    elsif board.board_full?
      puts 'It\'s a tie!'
      true
    end
  end

  def play_again?
    puts 'Would you like to play again? (y/n)'
    return unless gets.chomp.downcase == 'y'

    system 'clear'
    start_new_game
  end
end

def start_new_game
  Game.new.play
end

start_new_game
