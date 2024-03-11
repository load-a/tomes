class Converter
	def initialize scale_unit
		@unit = scale_unit
	end

	def change_unit!(new_unit)
		return if new_unit == @unit
		@unit = new_unit
	end

	def absolute_to_interval(dimension, reference_axis = 0) # => [69, 420] -> [64, 416]
	  n = dimension - reference_axis
	  r = reference_axis
	  (n - (n % @unit)) + r
	end

	def absolute_to_cell(dimension, reference_axis = 0)
		cell = (absolute_to_interval(dimension, reference_axis) - reference_axis) / @unit
		cell.floor
	end

	def interval_to_cell(interval, origin_offset = 0) # => [64, 416] -> [4, 26]
	  (interval / @unit - origin_offset / @unit).floor
	end

end