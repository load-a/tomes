require 'app/tomes/spells/geometry/location.rb'
require 'app/tomes/spells/geometry/size.rb'

module Apex
	def apex
		[apex_x, apex_y]
	end
	alias summit apex

	# The rightmost X coordinate.
	# @return Integer
	def apex_x
		x+width
	end

	# The topmost Y coordinate.
	# @return Integer
	def apex_y
		y+height
	end
end