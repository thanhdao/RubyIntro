#calculator.rb

continue = 'y'


while continue == 'y'

		puts " Enter number 1: "
		number1 = gets.chomp.to_i

		puts "Enter number 2: "
		number2 = gets.chomp.to_i

		puts " Choose operator -------------    1)  Addition  2)  Subtraction 3) Multiplication 4) Division ---------------"
		operator = gets.chomp.to_i

		result = 0

		case operator
		when 1
			result = number1 + number2
		when 2
			result = number1 - number2
		when 3
			result = number1 * number2
		when 4
			result = number1 / number2
		else
			puts "Not correct operator"
		end

		puts " The result is :  #{result}"

		puts " Do you want to continue (y/n)"

		continue = gets.chomp
end



