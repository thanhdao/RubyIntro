#rock_paper_scissors.rb
puts "Play Paper Rock Scissors!"
choices = ['P', 'R', 'S']
continue = 'y'

while continue =='y' || continue == 'Y'
	player_choose = ''
	while !choices.include?(player_choose)
		puts " Choose one:  (P/R/S)"
	 	player_choose = gets.chomp.upcase
 	end

 	computer_choose = choices.sample()
	puts " Your picked #{player_choose} and computer picked #{computer_choose}"

	if (player_choose == computer_choose)
		puts "It's a tie"
	else
		case player_choose
		when 'R'
			if computer_choose == 'P'
				puts "Paper wraps Rock! \n Computer won!"

			else
				puts "Rock wraps Scissors! \n You won!"
			end
		when 'P'
			if computer_choose == 'S'
				puts "Scissors wraps Paper! \n Computer won!"

			else
				puts "Paper wraps Rock! \n You won!"
			end
		when 'S'
			if computer_choose == 'R'
				puts "Rock wraps Scissors! \n Computer won!"

			else
				puts "Scissors wraps Paper! \n You won!"
			end
		end
	end

	puts "Play again? (y/n)"
	continue = gets.chomp

end





