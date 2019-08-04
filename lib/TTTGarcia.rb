require "TTTGarcia/version"
require "pry"

module TTTGarcia
  class Error < StandardError; end
    # Your code goes here...
    class Game
      attr_reader :dimention, :board

      def initialize
        @board=nil
        @board_array=nil
        @dimention = 0
      end

      def build
        puts 'Welcome to Tic Tac Toe¡'
        until valid_dimention?(@dimention)
          puts 'Please select Board dimentions (3-10max)'
          user_input = gets.chomp
          @dimention = input_to_num(user_input)
        end
        @board = Array.new(@dimention**2, " ")
        @board_array = @board.each_slice(@dimention).to_a
        display_board()
        #display_board_array(board_array)
        
      end

      def start
        play()
      end
      private

      def input_to_num(user_input)
        user_input.to_i
      end
      def input_to_index(user_input)
        user_input.to_i-1
      end
    
      def valid_dimention?(index)
        index.between?(3,10)
      end
    
      def display_board()
        @board.each_with_index do |element, index|
          !((index+1) % @dimention==0) ? print(" #{element} |"):print(" #{element}")
          print "\n" if (index+1) % @dimention==0
          1.times{print "---------\n"} if (index+1) % @dimention==0
        end
      end

      def display_board_array()
        @board_array.each do |row|
          puts "#{row}"
        end
      end
    
      def valid_index?(index)
        index.between?(1,@dimention**2)
      end
    
      def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
      end
      
      def valid_move?(index)
        index.between?(0,(@dimention**2)-1) && !position_taken?(index)
      end
    
      def turn_count()
        turn=0
        @board.each do |element|
          if element == "X" || element =="O"
            turn += 1
          end
        end
        return turn
      end
      
      def current_player()
        num_turns = turn_count()
        num_turns % 2 == 0 ? player = "X" : player = "O"
        player
      end
    
      def move(index, current_player)
        @board[index] = current_player
      end
      
      def ask_for_a_move
        gets.chomp
      end
      
      def turn()        
        index = 0    
          puts "Please choose a number from 1 to #{@dimention**2}"
          user_input = ask_for_a_move
          #user_input = gets.chomp
          index = input_to_index(user_input)    
        
        if valid_move?(index)
          player_token = current_player()
          move(index, player_token)
          @board_array = @board.each_slice(@dimention).to_a
          display_board()
          #display_board_array()
        else
          turn()
        end
      end
    
      def won?()
        #false       
#=begin       
        rows = @board_array.map do |row|
          row
        end
        cols = @dimention.times.collect do |i|
          @board_array.map do |row|
            row[i]
          end
        end

        diag = @dimention.times.collect do |i|
          @board_array[i][i]
        end

        invert_diag = @dimention.times.collect do |i|
          @board_array[i][@dimention-1-i]
        end

        join_winner = rows+cols
        join_winner.flatten!
        join_winner += diag + invert_diag
        win_combinations = join_winner.each_slice(@dimention).to_a

        def win_char win_combinations
          win_combinations[0] if win_combinations.uniq.length == 1 &&
          ["X","O"].include?(win_combinations[0])
        end

        char = win_combinations.map do |chorizo|
          win_char chorizo
        end.compact[0]

        
#=end
      end
    
      def full?()
        @board.all? {|index| index == "X" || index == "O"}
      end
    
      def draw?()
        full?() ? true : false
      end
    
      def over?()
        won?() || draw?() ? true : false
      end

      def winner()
#false
#=begin
        x_or_y=""
        x_or_y= won?()
        if x_or_y == false
          return nil
        else
          x_or_y == "X" ? "X" : "O"
        end
#=end
      end
    
      def play()
        until over?() == true
          turn()
        end
        if won?()
          puts "Congratulations #{winner()}¡¡¡"
        elsif draw?()
          puts "Cats Game¡"
        end
      end
  end
end



  







  
