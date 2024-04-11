module KeyboardNumerals
	def numeral
		down_inputs.select { |number, numeral| numbers.include? number}.map { |number| numbers[number] }
	end

	def numeral_held
		held_inputs.select { |number, numeral| numbers.include? number}.map { |number| numbers[number] }
	end
	alias numeral_hold numeral_held

	def numeral_up
		up_inputs.select { |number, numeral| numbers.include? number}.map { |number| numbers[number] }
	end

end