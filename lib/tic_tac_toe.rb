class TicTacToe

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [

    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],

    ]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
      puts "What is your chosen move (1-9)? "
      user_input.to_i - 1
    end

    def move(index, character)
      @board[index] = character
    end

    def position_taken?(index)
      if @board[index] == "X" || @board[index] == "O"
        return true
      else @board[index] == " " || ""
      return false
      end
    end

    def valid_move?(index)
      if position_taken?(index) == true
        return false
      elsif index.between?(0, 8) == false
        return false
      else (index.between?(0, 8))
        return true
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.chomp.to_i
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?

    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
          end
        end
      false
      end

      def full?

        return @board.include?(" ") ? false : true

      end

      def draw?
        if full? == true && won? == false
          true
        else
          false
        end
      end

      def over?
        if  won? || full? || draw?
          return true
        end
      end

      def winner

        winning = won?

        if winning === false
          return nil
        elsif @board[winning[0]] == "X"
          return "X"
        else
          @board[winning[0]] == "O"
          return "O"
        end
      end

      def play

        until over?
          turn
        end

        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

end
