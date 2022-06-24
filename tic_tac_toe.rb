# The game is played on a 3x3 grid.

# You are X, your opponent is O. Players take turns putting their marks in empty squares.

# The first player to get 3 of their marks in a row (up, down, across, or diagonally) is the winner.

# If all 9 squares are full and no player has 3 marks in a row, the game is over.


# def player_entry(position_number)
#     position number = gets.to_i


class Tic_tac_toe
    available_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    def play()
        print "Welcome to TicTacToe!! Would you like to go first? Yes or No: "
        start_input.upcase = gets.chomp
        if input == "YES" 
            puts "Please enter one of the following numbers: #{available_numbers}"
            user_play_input = gets.chomp.to_i
            
            

        end
    end

    def initialise_grid
        ["", "", "",
        "", "", "",
        "", "", ""]
    end

    def next_turn(player_type, grid, index)
        # check for invalid index
        if index < 1 || index > 9
            puts "invalid index try a number between 0-9"
            return
        end
        # determine token - this might me unneccessary as we could just pass in "X" or "O"
        token = ""
        if player_type == "player"
            token = "X"
        else
            token = "O"
        end
        # check to see if index has already been used
        if grid[index-1] != ""
            puts "invalid index this space is already taken try again\n"
        end
        grid[index-1] = token

        grid
    end

    def is_winner(grid)
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

    def is_draw(grid)
        !grid.include?("") && !is_winner(grid)
    end

    def print_grid
        puts "#{initialise_grid[0]} | #{initialise_grid[1]} | #{initialise_grid[2]}"
        puts "------"
        puts "#{initialise_grid[3]} | #{initialise_grid[4]} | #{initialise_grid[5]}"
        puts "------"
        puts "#{initialise_grid[6]} | #{initialise_grid[7]} | #{initialise_grid[8]}"
    end
end