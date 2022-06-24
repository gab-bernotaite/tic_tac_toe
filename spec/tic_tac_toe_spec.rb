require_relative '../tic_tac_toe'


describe 'tictactoe game' do
    it 'has a grid with width of 3 and a height of 3 meaning 3 * 3 = 9' do
        new_game = Tic_tac_toe.new
        grid = new_game.initialise_grid
        expect(grid.length).to eq(9)
    end

    it 'returns grid with X at index 1 of grid if human player enters 2' do
        new_game = Tic_tac_toe.new
        grid = new_game.initialise_grid
        expect(new_game.next_turn("player", grid, 2)).to eq(["", "X", "",
                                                    "", "", "",
                                                    "", "", ""])
    end

    it 'returns grid with O at index 1 of grid if computer player enters 2' do
        new_game = Tic_tac_toe.new
        grid = new_game.initialise_grid
        expect(new_game.next_turn("computer", grid, 2)).to eq(["", "O", "",
                                                      "", "", "",
                                                      "", "", ""])
    end

    it 'if player enters number out of bounds not between 1 & 9 inclusive then ask user to try again' do
        new_game = Tic_tac_toe.new
        grid = new_game.initialise_grid
        expect { new_game.next_turn("player", grid, 0) }.to output("invalid index try a number between 0-9\n").to_stdout
    end


    it 'if player enters number that has already been selected then tell user to try again' do
        new_game = Tic_tac_toe.new
        grid = new_game.initialise_grid
        new_game.next_turn("player", grid, 1)
        expect { new_game.next_turn("player", grid, 1) }.to output("invalid index this space is already taken try again\n").to_stdout
    end

    it 'if top row have all of the same X or Os then this is a winning game so return ' do
        new_game = Tic_tac_toe.new
        grid = [
            "X", "X", "X",
            "", "", "",
            "", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "",
            "X", "X", "X",
            "", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "",
            "", "", "",
            "X", "X", "X"
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "X", "", "",
            "X", "", "",
            "X", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "X", "",
            "", "X", "",
            "", "X", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "X",
            "", "", "X",
            "", "", "X"
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "X", "", "",
            "", "X", "",
            "", "", "X"
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "X",
            "", "X", "",
            "X", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "O", "", "",
            "O", "", "",
            "O", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "O", "O", "O",
            "", "", "",
            "", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "",
            "O", "O", "O",
            "", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "",
            "", "", "",
            "O", "O", "O"
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "O", "", "",
            "O", "", "",
            "O", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "O", "",
            "", "O", "",
            "", "O", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "O",
            "", "", "O",
            "", "", "O"
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "O", "", "",
            "", "O", "",
            "", "", "O"
        ]
        expect(new_game.is_winner(grid)).to eq(true)
        grid = [
            "", "", "O",
            "", "O", "",
            "O", "", ""
        ]
        expect(new_game.is_winner(grid)).to eq(true)
    end
    
    it 'if noone has got a line and all spaces are filled then it is a draw so return true' do
        new_game = Tic_tac_toe.new
        grid = [
            "O", "X", "O",
            "X", "X", "O",
            "O", "O", "X"
        ]
        expect(new_game.is_draw(grid)).to eq(true)
    end
end

describe 'when play() is called' do
    new_game = Tic_tac_toe.new
    new_game.play
    # it 'ask the user if they want to go first' do
    #     expect{ play() }.to output("Welcome to TicTacToe!! Would you like to go first? Yes or No: ").to_stdout
    # end

    # it 'when user gives an answer that is not No or Yes then ask again repeating what is expected' do
    #     play()
    #     $stdin = "nooooo" 
    #     expect{ play() }.to output("Try again. Would you like to go first? Yes or No: ").to_stdout
    #     $stdin = STDIN
    # end
end

# start with an empty grid
# the player makes a move - X i
# n the top-left (by entering "1")
# what does the grid look like?