module KeyboardLetters

	def letter
		down_inputs.select { |key| letters.include? key}
	end

	def letter_held
		held_inputs.select { |key| letters.include? key}
	end
	alias letter_hold letter_held

	def letter_up
		up_inputs.select { |key| letters.include? key}
	end

	def letter?
		letters.any? down_or_held_inputs
	end

end