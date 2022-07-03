# frozen_string_literal: true

class Game
  attr_reader :player_one_name, :player_two_name

  def initialize
    @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @@player_one_name = ''
    @@player_two_name = ''
  end

  def show_name
    puts @@player_one_name
    puts @@player_two_name
  end

  def draw_board
    horizontal_divider = '----------'
    puts "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
    puts horizontal_divider
    puts "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
    puts horizontal_divider
    puts "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
  end


  def player_1_move
    @next_turn = false 
    until @next_turn == true 
      puts "Select your move #{@@player_one_name}"
      @player_1_move = gets.chomp.to_i
      @player_1_index = (@player_1_move - 1).to_i 
      if @@board[@player_1_index] != "X" && @@board[@player_1_index] != "O"
          @@board[@player_1_index] = "X"
          @next_turn = true 
      else puts "INVALID SELECTION"  
      end 
    end 
    draw_board()
    end 

    def player_2_move
        @next_turn = false 
        until @next_turn == true 
          puts "Select your move #{@@player_two_name}"
          @player_2_move = gets.chomp.to_i
          @player_2_index = (@player_2_move - 1).to_i 
          if @@board[@player_2_index] != "X" && @@board[@player_2_index] != "O"
            @@board[@player_2_index] = "O"
            @next_turn = true 
        else puts "INVALID SELECTION"  
        end 
        end 

        draw_board()
    end

    def play_game
        player_1_move()
        player_2_move()
        player_1_move()
        player_2_move()
         player_1_move()
        player_2_move()
    end

    def check_win

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
