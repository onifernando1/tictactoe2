# frozen_string_literal: true

class Game
  attr_reader :player_one_name, :player_two_name

  def initialize
    @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @@player_one_name = ''
    @@player_two_name = ''
    @p1_win = false 
    @p2_win = false 
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
  
  def check_win

    # Horizontal rows 

    if @@board[0] == "X" && @@board[1] == "X" && @@board[2] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins"
     

    elsif @@board[0] == "O" && @@board[1] == "O" && @@board[2] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"
     

    elsif @@board[3] == "X" && @@board[4] == "X" && @@board[5] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins"
     

    elsif @@board[3] == "O" && @@board[4] == "O" && @@board[5] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"
     

    elsif @@board[6] == "X" && @@board[7] == "X" && @@board[8] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins"
     

    elsif @@board[6] == "O" && @@board[7] == "O" && @@board[8] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"
    

    #Vertical rows 

    elsif @@board[0] == "X" && @@board[3] == "X" && @@board[6] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins"
     

    elsif @@board[0] == "O" && @@board[3] == "O" && @@board[6] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"
    
    elsif @@board[1] == "X" && @@board[4] == "X" && @@board[7] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins" 

    elsif @@board[1] == "O" && @@board[4] == "O" && @@board[7] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"

    elsif @@board[2] == "X" && @@board[5] == "X" && @@board[8] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins" 

    elsif @@board[2] == "O" && @@board[5] == "O" && @@board[8] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"


    #Diagonals 
    elsif @@board[0] == "X" && @@board[4] == "X" && @@board[8] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins" 

    elsif @@board[0] == "O" && @@board[4] == "O" && @@board[8] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"

    elsif @@board[2] == "X" && @@board[4] == "X" && @@board[6] == "X"
      @p1_win = true 
      puts "#{@@player_one_name} wins" 

    elsif @@board[2] == "O" && @@board[4] == "O" && @@board[6] == "O"
      @p2_win = true 
      puts "#{@@player_two_name} wins"

    #draw
    
    elsif @@board[0] != 1 && @@board[1] != 2 && @@board[2] != 3 && @@board[4] != 5 && @@board[5] != 6 && @@board[7] != 8 && @@board[8] != 9 && @p1_win == false && @p2_win == false
      puts "DRAW"
      @p1_win = true 
      @p2_win = true
    end 
end 

  def player_1_move
    check_win()
    @next_turn = false 
    @round = 0
    if @round == 0
      draw_board()
    end 
    until @next_turn == true 
      @round += 1 
      puts "Select your move #{@@player_one_name}"
      @player_1_move = gets.chomp.to_i
      @player_1_index = (@player_1_move - 1).to_i 
      if @player_1_move != 1 && @player_1_move != 2 && @player_1_move != 3 && @player_1_move != 4 && @player_1_move != 5 && @player_1_move != 6 && @player_1_move != 7 && @player_1_move != 8 && @player_1_move != 9
        puts "INVALID "
      elsif @@board[@player_1_index] != "X" && @@board[@player_1_index] != "O"
          @@board[@player_1_index] = "X"
          @next_turn = true 
      else puts "INVALID SELECTION"  
      end 
    end 
    draw_board()
  end 

    def player_2_move
        check_win()
        @next_turn = false 
        until @next_turn == true 
          puts "Select your move #{@@player_two_name}"
          @player_2_move = gets.chomp.to_i
          @player_2_index = (@player_2_move - 1).to_i 
          if @player_2_move != 1 && @player_2_move != 2 && @player_2_move != 3 && @player_2_move != 4 && @player_2_move != 5 && @player_2_move != 6 && @player_2_move != 7 && @player_2_move != 8 && @player_2_move != 9
            puts "INVALID "
          elsif @@board[@player_2_index] != "X" && @@board[@player_2_index] != "O"
            @@board[@player_2_index] = "O"
            @next_turn = true 
          else puts "INVALID SELECTION"  
          end 
        end 

      draw_board()
    end

    def play_game
        
      until @p1_win == true || @p2_win == true 
        player_1_move()
        check_win()
        if @p1_win != true 
        player_2_move()
        end 
      end
    end 


end

class Player < Game
  def get_name
    puts 'What is the name of Player 1? '
    @@player_one_name = gets.chomp
    puts 'What is the name of Player 2? '
    @@player_two_name = gets.chomp
  end


end

game = Game.new
player = Player.new
player.get_name
game.show_name
game.play_game