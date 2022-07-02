# frozen_string_literal: true

class Game
  attr_reader :player_one_name, :player_two_name

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @@player_one_name = ''
    @@player_two_name = ''
  end

  def show_name
    puts @@player_one_name
    puts @@player_two_name
  end

  def draw_board
    horizontal_divider = '----------'
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts horizontal_divider
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts horizontal_divider
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def play_game
    puts "Select your move #{@@player_one_name}"
    @player_1_move = gets.chomp
    draw_board()
    puts "Select your move #{@@player_two_name}"
    @player_2_move = gets.chomp
    draw_board()
  end
end

class Player < Game
  def get_name
    puts 'What is the name of Player 1? '
    @@player_one_name = gets.chomp
    puts 'What is the name of Player 2? '
    @@player_two_name = gets.chomp
  end

  def assign_symbol
    @p1_symbol = 'X'
    @p2_symobl = 'O'
  end
end

game = Game.new
player = Player.new
player.get_name
player.assign_symbol
game.show_name
game.play_game
