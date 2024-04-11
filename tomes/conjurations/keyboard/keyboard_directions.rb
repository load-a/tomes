module KeyboardDirections

	def direction
		directions.map { |key, value|
			key unless (value.intersection down_inputs).empty?
		}.compact
	end

	def direction_held
		directions.map { |key, value|
			key unless (value.intersection held_inputs).empty?
		}.compact
	end
	alias direction_hold direction_held

	def direction_up
		directions.map { |key, value|
			key unless (value.intersection up_inputs).empty?
		}.compact
	end

	def direction?
		!direction_held.empty?
	end

end
