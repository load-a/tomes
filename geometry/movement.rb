require 'app/tomes/geometry/location.rb'

# The module responsible for the geometric translation of an object.
module Movement

	# Moves an object relative to its current location.
	# @param distances [Array<Integer>] The distances to move in the X and Y direction.
	# @return [Void]
	def move_relative_to_location(distances)
		self.x += distances[0]
		self.y += distances[1]
	end

	# Moves object to an absolute location on the screen.
	# @param location [Array<Integer>] The x and y coordinates of the place the object is being moved to.
	# @return [Void]
	def move_to_absolute_location(location)
		set_location! location
	end

end
