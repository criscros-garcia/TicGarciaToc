require "TTTGarcia/version"


module TTTGarcia
  class Error < StandardError; end
    # Your code goes here...
    class Game
      attr_accessor :dimention, :board
      

      def initialize(ultimo_ganador="")
        @board=nil
        @board_array=nil
        @dimention = 0
        @last_winner=ultimo_ganador
        #@second_to_last = penultimo
      end

      def build()
        system "clear"
        puts "Welcome to Tic Tac Toe¡ - Last winner #{@last_winner}"
        until valid_dimention?(@dimention)
          puts 'Please select Board dimentions (3-10max)'
          user_input = gets.chomp
          @dimention = input_to_num(user_input)
        end
        @board = Array.new(@dimention**2, " ")
        @board_array = @board.each_slice(@dimention).to_a
        display_board()        
      end

      def start
        play()
      end

      def ultimo_ganador()
        winner()
      end

      def penultimo()
        draw?
      end

      #private

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
          1.times{print "-------------\n"} if (index+1) % @dimention==0
        end
      end

      def display_board_array()
        @board_array.each do |row|
          puts "#{row}"
        end
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
        if @last_winner ==""
          num_turns % 2 == 0 ? player = "X" : player = "O"
        elsif @last_winner == "X"
          num_turns % 2 == 0 ? player = "O" : player = "X"
        elsif @last_winner == "O"
          num_turns % 2 == 0 ? player = "X" : player = "O"
        end
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
        rows = @board_array.map do |row| row end
        
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
        x_or_o=""
        x_or_o= won?()
        if x_or_o == false
          return nil
        else
          x_or_o == "X" ? "X" : "O"
        end
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



  







  
