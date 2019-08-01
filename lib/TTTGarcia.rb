require "TTTGarcia/version"
require "pry"

module TTTGarcia
  class Error < StandardError; end
    # Your code goes here...
    class Game
      
      def start
        @board=nil
        @board_array=nil

        puts 'Welcome to Tic Tac Toe¡'
        dimention = 0
        until valid_dimention?(dimention)
          puts 'Please select Board dimentions (3-10max)'
          user_input = gets.chomp
          dimention = input_to_num(user_input)
        end
        @board = Array.new(dimention**2, " ")
        @board_array = @board.each_slice(dimention).to_a
        #display_board(board, dimention)
        #display_board_array(board_array)
        play(dimention)
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
    
      def display_board(dimention)
        @board.each_with_index do |element, index|
          !((index+1)%dimention==0) ? print(" #{element} |"):print(" #{element}")
          print "\n" if (index+1)%dimention==0
          1.times{print "---------\n"} if (index+1)%dimention==0
        end
      end

      def display_board_array()
        @board_array.each do |row|
          puts "#{row}"
        end
      end
    
      def valid_index?(index, dimention)
        index.between?(1,dimention**2)
      end
    
      def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
      end
      
      def valid_move?(index, dimention)
        index.between?(0,(dimention**2)-1) && !position_taken?(index)
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
      
      def turn(dimention)        
        index = 0    
          puts "Please choose a number from 1 to #{dimention**2}"
          user_input = gets.chomp
          index = input_to_index(user_input)    
        
        if valid_move?(index, dimention)
          player_token = current_player()
          move(index, player_token)
          @board_array = @board.each_slice(dimention).to_a
          display_board(dimention)
          display_board_array()
        else
          turn(dimention)
        end
      end
    
      def won?()
false       
=begin        
        
=end
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
false
=begin
        index=[]
        index = won?(board_array)
        if index == false
          return nil
        else
          board_array[index[0]] == "X" ? "X" : "O"
        end
=end
      end
    
      def play(dimention)
        until over?()       
          puts "#{@board_array}"          
          turn(dimention)
        end
        if won?()
          puts "Congratulations¡ #{winner()}"
        elsif draw?()
          puts "Cats Game¡"
        end
      end
  end
end



  







  
