require 'app/tomes/spells/geometry/dimensions.rb'

module Rectangle
	include Dimensions
	include Rectangle::Geometry

end

module Rectangle::Geometry
	def perimeter
		width*2 + height*2
	end

	def area
		width * height
	end

	def hypotenuse
		Math::sqrt(width**2 + height**2).round(02)
	end
end
