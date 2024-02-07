##
# This MODULE allows for easy color manipulation within rendered objects.
# Any object that use it must have a @color attribute that contains an hash with RGB values.
# This array is merged with the object's rendering hash to give it the desired color.
# This module also includes @saved_color and @saved_alpha variables to make switching between colors more convenient.
# An example of its usage is below:
#
# class Actor
# 	include Colors
# 	...etc
# end
#
# args.state.player_sprite.change_color(Color.blue)
#

module Colors
	def get_color
		@color[:color_name]
	end
	alias color get_color

	def change_color!(color)
		if color.class == Symbol
			return @color = Color.all.find {|c| c[:color_name] == color}
		end
		@color = color
	end

	def save_color!
		@saved_color = @color
	end

	def reload_color!
		change_color!(@saved_color)
	end
	alias load_color! reload_color!
	alias reset_color! reload_color!

	def saved_color
		@saved_color[:color_name]
	end

	def get_alpha
		@alpha
	end
	alias alpha get_alpha
	alias transparency get_alpha

	def change_alpha!(intensity)
		@alpha = intensity
	end
	alias change_transparency! change_alpha!


	def save_alpha! 
		@saved_alpha = @alpha
	end
	alias save_transparency! save_alpha!


	def reload_alpha!
		@alpha = @saved_alpha
	end
	alias load_alpha! reload_alpha!
	alias reload_transparency! reload_alpha!
	alias load_transparency! reload_alpha!
end

