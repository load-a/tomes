module Position
	extend self
	
	def these_collide?(primary_object, secondary_object)
		primary_object.top > secondary_object.bottom and
		primary_object.left < secondary_object.right and
		primary_object.bottom < secondary_object.top and
		primary_object.right > secondary_object.left
	end
	alias collide? these_collide?

	def subtract_coordinates(first_coordinates, second_coordinates)
		[ first_coordinates[0] - second_coordinates[0] , first_coordinates[1] - second_coordinates[1] ]
	end

	def add_coordinates(first_coordinates, second_coordinates)
		[ first_coordinates[0] + second_coordinates[0] , first_coordinates[1] + second_coordinates[1] ]
	end

	def left_of(object, spacing = 1)
		object.x - spacing
	end

	def right_of(object, spacing = 1)
		object.x + object.width + spacing
	end

	def above(object, spacing = 1)
		object.y + object.height + spacing
	end

	def below(object, spacing = 1)
		object.y - spacing
	end
end