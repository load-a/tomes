require 'app/tomes/geometry/location.rb'
require 'app/tomes/geometry/size.rb'

# Combines Location (x and y coordinates) and Size (width and height).
module Dimensions
	include Location
	include Size

	# A hash containing the four dimensions of an object.
	# @note The keys are named to fit DragonRuby's attribute conventions. 
	# @return [Hash]
	def dimensions
		{
			x: x,
			y: y,
			w: width,
			h: height,
			primitive_marker: :border
		}
	end
	alias rect dimensions

	# @note Only meant to be used with object initialization.
	# @return [Void]
	def set_dimensions!(location, size)
		set_location! location
		set_size! size
	end

end
