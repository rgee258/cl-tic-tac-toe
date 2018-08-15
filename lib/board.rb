class Board

require "player"

	def initialize
		@name1 = "p1"
		@name2 = "p2"
		@player1 = nil
		@player2 = nil
		@game_board = []
		@game_won = false
		@winning_mark = ""
	end

	def start_game
		puts "Let's play Tic-Tac-Toe!"
		puts "What is the name of the first player?"
		name1 = gets.chomp
		puts "Next! What is your name second player?"
		name2 = gets.chomp
		@name1 = name1
		@name2 = name2
	end

	def create_board
		3.times {@game_board.push([" ", " ", " "])}
		if (rand.round == 0)
			# Give each player their inputted name, board mark, and player number
			@player1 = Player.new(@name1, "X", "1")
			@player2 = Player.new(@name2, "O", "2")
		else
			@player1 = Player.new(@name2, "X", "1")
			@player2 = Player.new(@name1, "O", "2")
		end
		puts "#{@player1.name} you are Player 1! You go first and will use X's."
		puts "#{@player2.name} you are Player 2! You go second and will use O's."
	end

	def instructions
		row_count = 0
		sample_board = []
		sample_board.push(["1", "2", "3"])
		sample_board.push(["4", "5", "6"])
		sample_board.push(["7", "8", "9"])
		sample_board.each do |outer|
			line_count = 0
			outer.each do |inner|
				print inner
				print "|" if line_count < 2
				line_count += 1
			end
			puts "\n-----" if row_count < 2
			row_count += 1
		end
		puts "\n"
		puts "Here is your grid, every position is marked with a number of 1 to 9."
		puts "When it's your turn and you are prompted, type in your grid spot to place your mark."
	end

	def display_board
		row_count = 0
		@game_board.each do |outer|
			line_count = 0
			outer.each do |inner|
				print inner
				print "|" if line_count < 2
				line_count += 1
			end
			puts "\n-----" if row_count < 2
			row_count += 1
		end
		puts "\n"
	end

	def update_board(position, mark)
		case position
		when 1
			@game_board[0][0] = mark
		when 2
			@game_board[0][1] = mark
		when 3
			@game_board[0][2] = mark
		when 4
			@game_board[1][0] = mark
		when 5
			@game_board[1][1] = mark
		when 6
			@game_board[1][2] = mark
		when 7
			@game_board[2][0] = mark
		when 8
			@game_board[2][1] = mark
		when 9
			@game_board[2][2] = mark
		else
			puts "Error updating game board."
			puts "Game terminating, please try playing again."
			exit(1)
		end
	end

	def check_win?
		# Here we check for the same marks, but also to make sure that the placeholder spaces are not matched
		# Top row
		if (@game_board[0][0] == @game_board[0][1] && @game_board[0][1] == @game_board[0][2] && 
			@game_board[0][0] != " " && @game_board[0][1] != " " && @game_board[0][2] != " ")
			@winning_mark = @game_board[0][2]
			return true
		# Middle row
		elsif (@game_board[1][0] == @game_board[1][1] && @game_board[1][1] == @game_board[1][2] && 
			@game_board[1][0] != " " && @game_board[1][1] != " " && @game_board[1][2] != " ")
			@winning_mark = @game_board[1][2]
			return true
		# Bottom row
		elsif (@game_board[2][0] == @game_board[2][1] && @game_board[2][1] == @game_board[2][2] && 
			@game_board[2][0] != " " && @game_board[2][1] != " " && @game_board[2][2] != " ")
			@winning_mark = @game_board[2][2]
			return true
		# Left column
		elsif (@game_board[0][0] == @game_board[1][0] && @game_board[1][0] == @game_board[2][0] && 
			@game_board[0][0] != " " && @game_board[1][0] != " " && @game_board[2][0] != " ")
			@winning_mark = @game_board[2][0]
			return true
		# Middle column
		elsif (@game_board[0][1] == @game_board[1][1] && @game_board[1][1] == @game_board[2][1] && 
			@game_board[0][1] != " " && @game_board[1][1] != " " && @game_board[2][1] != " ")
			@winning_mark = @game_board[2][1]
			return true
		# Right column
		elsif (@game_board[0][2] == @game_board[1][2] && @game_board[1][2] == @game_board[2][2] && 
			@game_board[0][2] != " " && @game_board[1][2] != " " && @game_board[2][2] != " ")
			@winning_mark = @game_board[2][2]
			return true
		# Left diagonal
		elsif (@game_board[0][0] == @game_board[1][1] && @game_board[1][1] == @game_board[2][2] && 
			@game_board[0][0] != " " && @game_board[1][1] != " " && @game_board[2][2] != " ")
			@winning_mark = @game_board[2][2]
			return true
		# Right diagonal
		elsif (@game_board[0][2] == @game_board[1][1] && @game_board[1][1] == @game_board[2][0] && 
			@game_board[0][2] != " " && @game_board[1][1] != " " && @game_board[2][0] != " ")
			@winning_mark = @game_board[2][0]
			return true
		end
		false
	end

	def declare_winner(winning_mark)
		if (winning_mark == @player1.mark)
			puts "Player 1, #{@player1.name}, is the winner!"
		elsif (winning_mark == @player2.mark)
			puts "Player 2, #{@player2.name}, is the winner!"
		else
			puts "Error declaring winner."
		end
		exit(0)
	end

	def draw_check
		slot_count = 0
		@game_board.each do |outer|
			outer.each do |inner|
				# Add one for each position on the board that is filled
				slot_count += 1 if inner != " "
			end
		end
		slot_count
	end

	def declare_draw
		puts "Looks like this game ends in a draw."
		puts "Take a swing at it again if you guys want a winner!"
		exit(0)
	end

	public

	def play_game
		# Set up the game
		start_game
		create_board
		instructions
		player1_turn = true
		won = false
		draw = false
		# Loop for taking turns
		until (won)
			display_board
			# Check for a win or draw
			won = check_win?
			break if won
			# If all slots are filled, then we have a draw
			if (draw_check == 9)
				draw = true
				break
			end

			# Player 1's turn
			if (player1_turn)
				player1_turn = false
				update_board(@player1.make_move, @player1.mark)
			# Player 2's turn
			else
				player1_turn = true
				update_board(@player2.make_move, @player2.mark)
			end
		end
		# Output for if there's a draw or a winner
		if (draw)
			declare_draw
		else
			declare_winner(@winning_mark)
		end
	end

end

# Create a new board and start a game
game = Board.new
game.play_game