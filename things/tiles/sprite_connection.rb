require 'app/tomes/things/tiles/sprite.rb'

# This module overrides existing methods to allow objects to sync up with their sprites. 
module SpriteConnection

	# @note: Moves the sprite image along with the actual object it's attached to.
	# @return [Void]
	def move_relative_to_location(distances)
		super
		sprite.move_relative_to_location(distances)
	end

	# @param location [Array<Integer>] The coordinates of the new location.
	# @return [Void]
	def move_to_absolute_location(location)
		super
		sprite.move_to_absolute_location(location)
	end

	# @param new_sprite [Array<Integer>, Symbol]
	# @return [Void]
	def change_sprite!(new_sprite)
		sprite.change_name!(new_sprite)
		name = sprite.name
	end

	# @param color [Color, Symbol]
	# @return [Void]
	def change_color!(color)
		sprite.change_color!(color)
	end

	# @param color [Color, Symbol]
	# @return [Void]
	def set_color!(color)
		sprite.change_color!(color)
		sprite.save_color!
	end

	# @return [Void]
	def reset_color!
		sprite.reset_color!
	end

	# @return [Void]
	def primitives
		sprite.primitives
	end

end