require 'app/tomes/geometry/position.rb'
require 'app/tomes/geometry/perimeter.rb'

# A module for handling all geometric attributes the object may have.
module Geometry
	include Position
	include Perimeter 

	# Determines whether two objects collide.
	# @note False will be returned for objects that only touch!
	# @param primary_object [Object]
	# @param	secondary_object [Object]
	# @return [Boolean]
	def self.collision_check?(primary_object, secondary_object)
		primary_object.top > secondary_object.bottom and
		primary_object.left < secondary_object.right and
		primary_object.bottom < secondary_object.top and
		primary_object.right > secondary_object.left
	end

end
