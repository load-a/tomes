require 'app/tomes/spells/geometry/location.rb'
require 'app/tomes/spells/geometry/size.rb'
require 'app/tomes/spells/geometry/apex.rb'
require 'app/tomes/spells/geometry/center.rb'

module Dimensions
	include Location
	include Size
	include Apex
	include Center

	def rect
		dimensions.merge({:primitive_marker => :border})
	end

	def dimensions
		{
			x: x,
			y: y,
			w: width,
			h: height,
		}
	end

	def set_dimensions(location, size)
		set_location location
		set_size size
	end
	alias change_dimensions set_dimensions

	alias bottom_side y
	alias bottom y

	alias left_side x
	alias left x

	alias right_side apex_x
	alias right apex_x

	alias top_side apex_y
	alias top apex_y
end
