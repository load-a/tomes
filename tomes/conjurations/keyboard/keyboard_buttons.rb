module KeyboardButtons
	def button
		buttons.map { |key, value|
			key unless (value.intersection down_inputs).empty?
		}.compact
	end

	def button_held
		buttons.map { |key, value|
			value = [value] unless value.kind_of? Array
			key unless (value.intersection held_inputs).empty?
		}.compact
	end
	alias button_hold button_held

	def button_up
		buttons.map { |key, value|
			key unless (value.intersection up_inputs).empty?
		}.compact
	end

	def button?
		!button_held.empty?
	end
end
