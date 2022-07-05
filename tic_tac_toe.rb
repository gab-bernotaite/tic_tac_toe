# The game is played on a 3x3 grid.

# You are X, your opponent is O. Players take turns putting their marks in empty squares.

# The first player to get 3 of their marks in a row (up, down, across, or diagonally) is the winner.

# If all 9 squares are full and no player has 3 marks in a row, the game is over.


# def player_entry(position_number)
#     position number = gets.to_i





# To-do list:

# 3. Win game while loop - take out inside checks and replace with player 1 or player 2 won, add game retart option
# 4. Add a function that determines who the winner is
# 5. separate into classes
# 6. separate all clsses and corresponding tests into separate files
# 7. Make computer game function intelligent



# ------->>>>>>>> if we separate into classes put them into different classes and put classes into different files also
# 

class Tic_tac_toe

    def initialise_grid
        # initialise - constructor - this is called when you pass something into the class, initialises an element you create in that class
        ["1", "2", "3",
        "4", "5", "6",
        "7", "8", "9"]
    end

    @@available_numbers = []

    def play_game
        @@available_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        print "Welcome to TicTacToe!! Would you like to go first? Yes or No: \n \n "
        start_input = gets.chomp
        start_input = start_input.upcase!

        grid = initialise_grid
        whos_turn_is_it_next = ""

        if start_input == "YES"
            whos_turn_is_it_next = "computer"
            grid = person_play(grid)

        elsif start_input == "NO"
            whos_turn_is_it_next = "person"
            grid = computer_play(grid)

        else
            puts "Invalid entry, the game will restart"
            # ask question while input is not yes or no
            # question --> start function, give input
            # if yes - condition in while loop will break
            # if answer is neither yes or no, it will keep asking question until loop is broken
            play_game()
        end

        # once this breaks it needs to ask user if they want to play again
        while !win_game?(grid) || !is_draw?(grid)
            # shouldn't check if win game is true inside this loop
            # need to make it clear who the winner is 
            # return hash that holds win = true and player

            if whos_turn_is_it_next == "computer"
                whos_turn_is_it_next = "person"
                grid = computer_play(grid)
                if win_game?(grid)
                    print_grid(grid)
                    puts "\n \n Computer Wins!! "
                    break
                    play_game()
                end
                if is_draw?(grid)
                    puts "\n It's a draw!!"
                    play_game()
                end
            else
                whos_turn_is_it_next = "computer"
                grid = person_play(grid)
                if win_game?(grid)
                    print_grid(grid)
                    puts "\n \n You win!!!"
                    break
                    play_game()
                end
                if is_draw?(grid)
                    puts "\n It's a draw!!"
                    play_game()
                end
            end
        end
    end

    def person_play(grid)
        token = "X"
        puts "\n Please enter one of the following numbers: \n \n"
        print_grid(grid)
        user_play_input = gets.chomp.to_i
        if !@@available_numbers.include?(user_play_input) || user_play_input == nil
            puts "invalid input, try again\n"
            person_play(grid)
        else
            grid[user_play_input-1] = token
            @@available_numbers.delete(user_play_input)
            grid
        end
    end
    # to test for next move - take grid as argument, the grid that you pass in can be in any state - create new board and put marks on the board - pass that board to the function, the function should do the right action based on the current state of the board

    def computer_play(grid)
        token = "O"
        computer_choice_position = @@available_numbers.sample()
        if computer_choice_position != nil
            grid[computer_choice_position-1] = token
        end
        @@available_numbers.delete(computer_choice_position)
        grid
    end

    def determine_outcome(grid, winner)
        if win_game?(grid)
            print_grid(grid)
            puts "\n \n #{winner} Wins!!"
            break
            play_game()
        end
        if is_draw?(grid)
            puts "\n It's a draw!!"
            play_game()
        end
    end

    def win_game?(grid)
        # name this function so you can answer with true or false, ? at the end
        # win_game?
        # check top row
        top_row = grid[0] + grid[1] + grid[2]
        middle_row = grid[3] + grid[4] + grid[5]
        bottom_row = grid[6] + grid[7] + grid[8]
        left_column = grid[0] + grid[3] + grid[6]
        middle_column = grid[1] + grid[4] + grid[7]
        right_column = grid[2] + grid[5] + grid[8]
        diag_top_left_to_bottom_right = grid[0] + grid[4] + grid[8]
        diag_bottom_left_to_top_right = grid[6] + grid[4] + grid[2]
        if top_row == "XXX" || top_row == "OOO" || 
            middle_row == "XXX" || middle_row == "OOO" ||
            bottom_row == "XXX" || bottom_row == "OOO" ||
            left_column == "XXX" || left_column == "OOO" ||
            middle_column == "XXX" || middle_column == "OOO" ||
            right_column == "XXX" || right_column == "OOO" ||
            diag_top_left_to_bottom_right == "XXX" || diag_top_left_to_bottom_right == "OOO" ||
            diag_bottom_left_to_top_right == "XXX" || diag_bottom_left_to_top_right == "OOO"
            true
        else
            false
        end
    end
    
    def is_draw?(grid)
        @@available_numbers.empty? && !win_game?(grid)
    end
end


    def print_grid(grid)
        puts "#{grid[0]} | #{grid[1]} | #{grid[2]}"
        puts "---------"
        puts "#{grid[3]} | #{grid[4]} | #{grid[5]}"
        puts "---------"
        puts "#{grid[6]} | #{grid[7]} | #{grid[8]}"
    end


    # who's_turn_is_it = player_1 ? who's_turn_is_it = player_2 : who's_turn_is_it = player_1