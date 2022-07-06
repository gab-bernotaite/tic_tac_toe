# The game is played on a 3x3 grid.

# You are X, your opponent is O. Players take turns putting their marks in empty squares.

# The first player to get 3 of their marks in a row (up, down, across, or diagonally) is the winner.

# If all 9 squares are full and no player has 3 marks in a row, the game is over.

# def player_entry(position_number)
#     position number = gets.to_i

# To-do list:
# 4. Add a function that determines who the winner is
# 5. separate into classes
# 6. separate all clsses and corresponding tests into separate files
# 7. Make computer game function intelligent

# ------->>>>>>>> if we separate into classes put them into different classes and put classes into different files also
# 

class Tic_tac_toe

    def initialize
        @@whos_turn_is_it_next = nil
        @@grid = nil
    end

    def play_game()
        @@grid = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        @@whos_turn_is_it_next = who_starts_game

        while !win_game? || !is_draw?
            if @@whos_turn_is_it_next == "computer"
                @@whos_turn_is_it_next = "person"
                computer_play()
                play_game() if print_outcome()
            else
                @@whos_turn_is_it_next = "computer"
                person_play()
                play_game() if print_outcome()
            end
        end
    end

    def who_starts_game()
        puts ""
        puts "Welcome to TicTacToe!! Would you like to go first? Yes or No:"
        puts ""

        who_starts_input = gets.chomp.upcase

        if who_starts_input == "YES"
            "person"
        elsif who_starts_input == "NO"
            "computer"
        else
            puts ""
            puts "Invalid entry, try again."
            who_starts_game()
        end
    end

    def person_play()
        token = "X"
        puts ""
        puts "Your turn... Please enter one of the following numbers:"
        puts ""
        print_grid()
        puts ""
        person_position_input = gets.chomp

        if !@@grid.include?(person_position_input)
            puts ""
            puts "Invalid input, try again."
            person_play()
        else
            @@grid[person_position_input.to_i-1] = token
        end
    end

    def computer_play()
        token = "O"
        puts ""
        puts "Computers turn... Computer has played."

        computer_choice_position = @@grid.filter { |i| (1..9).include? i.to_i }.sample()
        @@grid[computer_choice_position.to_i-1] = token
    end

    def print_outcome()
        output = @@whos_turn_is_it_next == "computer" ? "You are the" : "The Computer is the"
        if win_game?
            puts ""
            print_grid()
            puts ""
            puts "#{output} Winner!!"
            true
        elsif is_draw?
            puts ""
            print_grid()
            puts ""
            puts "It's a draw!!"
            true
        else
            false
        end
    end

    def win_game?()
        [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [6,4,2]
        ].any? { |i| 
            pos_1 = @@grid[i[0]]
            pos_2 = @@grid[i[1]]
            pos_3 = @@grid[i[2]]

            winning_line = pos_1 + pos_2 + pos_3

            winning_line == "XXX" || winning_line == "OOO"
        }
    end
    
    def is_draw?()
        @@grid.all? { |i| 
            i == "X" || i == "O" 
        } && !win_game?()
    end

    def print_grid()
        puts "#{@@grid[0]} | #{@@grid[1]} | #{@@grid[2]}"
        puts "---------"
        puts "#{@@grid[3]} | #{@@grid[4]} | #{@@grid[5]}"
        puts "---------"
        puts "#{@@grid[6]} | #{@@grid[7]} | #{@@grid[8]}"
    end
end