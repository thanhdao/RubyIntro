#tictactoe.rb

# draw a board

#assign player 1  to "X"

# assign player 2 to "O"

# player 1 picks a empty square
# player 2 picks a empty square

# loop until a winner or all squares are taken
# 	player 1 picks a empty square
# 	check for a winner
# 	player 2 picks a empty square
# 	check for a winner
# if there's a winner
# 	show the winner
# 	or else
# 	it's a tie
# 	#
require 'pry'

def initialize_board
	b = {}
	(1..9).each{|position| b[position] = ' '}
	b
end


def draw_board(b)
	system 'clear'

	puts " #{b[1]} | #{b[2]} | #{b[3]} "
	puts "---+---+---"
	puts " #{b[4]} | #{b[5]} | #{b[6]} "
	puts "---+---+---"
	puts " #{b[7]} | #{b[8]} | #{b[9]} "

end

def empty_positions(b)
	b.select {|k, v| v == ' ' }.keys
end

def player_picks_square(b)
	puts "Pick a square (1 - 9): "
	position = gets.chomp.to_i
	b[position] = 'X'
end

def  computer_picks_square(b)
	position = empty_positions(b).sample
	b[position] = 'O'
end

def check_winner(b)
	winner = nil
	winning_lines = [[1,2,3], [4,5,6],[7,8,9], [1,4,7], [2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	winning_lines.each do |line|
		if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
			winner = 'Player'
			break
		elsif b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] == 'O'
			winner = 'Computer'
			break
		end
	end
	winner
end

board = initialize_board
draw_board(board)

begin

	player_picks_square(board)
	draw_board(board)
	winner = check_winner(board)
	if winner != nil
		break
	end

	computer_picks_square(board)
	draw_board(board)
	winner = check_winner(board)
	if winner != nil
		break
	end

end until empty_positions(board).empty?

if check_winner(board) != nil
 	puts "#{check_winner(board)} won!"
 end

#winner || all_squares_taken?

