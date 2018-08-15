class Player

	attr_reader :name
	attr_reader :mark
	attr_reader :player_number

	def initialize(name, mark, player_number)
		@name = name
		@mark = mark
		@player_number = player_number
		@@placed_marks = []
	end

	private

	def input_check(check)
		invalid_input = /[1-9]/.match(check).nil?
		while (invalid_input)
			puts "Invalid input, please enter from 1 - 9 again."
			check = gets.chomp
			invalid_input = /[1-9]/.match(check).nil?
		end

		check
	end

	def repeat_check?(check)
		repeated = false
		@@placed_marks.each do |elem|
			if (check == elem)
				# Although it is rather arbitrary, return early to prevent duplicates placed_marks
				return true
			end
		end
		# Maintain a class variable that stores all placed marks by both players
		@@placed_marks.push(check)
		repeated
	end

	public

	def make_move
		puts "Player #{@player_number} it's your turn. Enter 1 - 9 to mark your spot."
		input = gets.chomp
		# Check the input and get one returned if there's an invalid input
		input = input_check(input)
		# Check for repeats against the placed_marks and recall make_move if a repeat spot is attempted
		repeated = repeat_check?(input)
		if (repeated)
			puts "Looks like you tried to place a mark on a spot already filled. Let's try this again..."
			input = make_move
		end
		# Convert back to integer because update_board tests for integers
		input.to_i
	end
	
end