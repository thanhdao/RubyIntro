#blackjack.rb

def calculate_total(cards)
	#
	arr = cards.map{|e| e[1]}
	total = 0
	#numbers = ['2', '3','4','5', '6','7','8','9','10']
	tens = ['J', 'Q', 'K']
	 aces = arr.count('A')
	 arr.delete('A')
	 arr.each do |value|
			if tens.include?(value)
				total += 10
			else
				total += value.to_i
			end
	end

	if  aces > 1
		total += aces
	elsif aces == 1

		if total >=11
			total += 1
		else
			total += 11
		end

	end

	total


end

def win?(score)
end

#Start Game
con = 'y'

begin

	puts "Welcome to Blackjack!"

	suits = ['H', 'D', 'S', 'C']
	cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

	deck = suits.product(cards)
	deck.shuffle!

	#Deal Cards

	mycards = []
	dealercards = []

	mycards << deck.pop
	dealercards << deck.pop
	mycards << deck.pop
	dealercards << deck.pop



	dealertotal = calculate_total(dealercards)
	mytotal = calculate_total(mycards)

	# Show Cards

	puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
	puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
	puts ""

	#Check winner
	if mytotal == 21
		puts "Congratulation, you hit blackjack! You won!"
		next
	elsif mytotal > 21
		puts "Sorry, it looks like you busted!"
		next
	end

	if dealertotal == 21
		puts "Sorry, dealer hit blackjack! You lost!"
		next
	elsif dealertotal > 21
		puts "Congratulations,  it looks like dearler busted! You won!"
		next
	end


	# Player turn

	while mytotal < 21
		puts "What would you like to do? 1) hit 2) stay"
		hit_or_stay = gets.chomp

		if !['1','2'].include?(hit_or_stay)
			puts " Error: you must enter 1 or 2"
			next
		end

		if hit_or_stay == "2"
			break
		end

		#hit
		new_card = deck.pop
		puts "Dealing"
		mycards << new_card

		mytotal = calculate_total(mycards)
		puts "Your total is now: #{mytotal}"

	end

	if mytotal == 21
		puts "Congratulation, you hit blackjack! You won!"
		next
	elsif mytotal > 21
		puts "Sorry, it looks like you busted!"
		next
	end


	# Dealer turn
	while dealertotal < 17

		#hit
		new_card = deck.pop
		puts "Dealing new card for dealer: #{new_card}"
		dealercards << new_card

		dealertotal = calculate_total(dealercards)
		puts "Your total is now: #{mytotal}"

	end

	if dealertotal == 21
		puts "Sorry, dealer hit blackjack! You lost!"

	elsif dealertotal > 21
		puts "Congratulations,  it looks like dearler busted! You won!"

	end

	# Compare

	puts "Dealer's cards: "
	dealercards.each do |card|
		puts "=> #{card}"
	end

	puts "Your cards: "
	mycards.each do |card|
		puts "=> #{card}"
	end

	if dealertotal > mytotal
		puts "Sorry, dealer won!"
	elsif dealertotal < mytotal
		puts "Congratulations! You won!"
	else
		puts "It's a tie"
	end

	#Play again

	puts " Do you want to play again(y/n)?"
	con = gets.chomp.downcase

end  until con != 'y'








