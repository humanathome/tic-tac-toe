# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# main game class
class Game
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
      player_turn(@player1)
      @board.display_game_board
      break if game_over?

      player_turn(@player2)
      @board.display_game_board
      break if game_over?
    end
    play_again?
  end

  private

  def player_turn(player)
    puts "#{player.name}, please choose an available number between 1 and 9 to place your symbol '#{player.symbol}':"
    field = gets.chomp.to_i
    until player.player_input_valid?(field) && @board.field_available?(field)
      puts 'Invalid selection. Please enter a number between 1 and 9:'
      field = gets.chomp.to_i
    end
    @board.place_symbol(field, player.symbol)
  end

  def game_over?
    if @board.winner_found?(@player1.symbol)
      p "#{@player1.name} wins!"
    elsif @board.winner_found?(@player2.symbol)
      p "#{@player2.name} wins!"
    elsif @board.board_full?
      p 'It\'s a tie!'
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
