require 'app/tomes/spells/geometry/location.rb'
require 'app/tomes/spells/geometry/size.rb'

module Center
	def center_point
		[horizontal_center, vertical_center]
	end
	alias center center_point

	def horizontal_center
		x + width/2
	end
	alias center_x horizontal_center

	def vertical_center
		y + height/2
	end
	alias	center_y vertical_center
end
