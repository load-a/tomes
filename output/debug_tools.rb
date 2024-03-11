# This module includes some useful debug methods.
# This file must be required in the main file to be used.

module DebugTools
	# A general use mode variable.
	@mode = 1

	def self.mode
		@mode
	end

	# This method increments the mode from 0 to 7, then wraps it back to 0.
	# This is an increment method, but it includes logic for decrementing as well.
	def self.increment_mode!
		@mode += 1
		@mode = 0 if @mode > 7
		@mode = 7 if @mode < 0
	end

	def self.set_mode!(mode)
		@mode = mode
	end

	# This method takes a list of strings and renders each from top to bottom
	# The term "point" refers to a point on the screen, passed as an [x, y] array, that the rendering will start at.
	def self.list(point, text, args)
		return if text == nil
		args.outputs.labels << text.to_a.map_with_index { |e, i|
			{
				x: point[0],
				y: point[1] - (i * 25),
				text: e
			}
		}
	end

	# This method takes an array of objects and renders each.
	# All objects in the list must have a "primitives" attribute, which contains its rendering hash.
	def self.quick_render_primitives(list, args)
		args.outputs.primitives << list.map { |e|
			e.primitives 
		}
	end

	def self.quick_render(list, args)
		args.outputs.primitives << list
	end

	# This method takes a list of objects and renders each's border primitive.
	# All objects passed to it are expected to have a hash with x, y, h, w keys, as well as a "primitive_marker: border" entry.
	# This can be useful for rendering hitboxes.
	def self.render_borders(list, args)
		args.outputs.primitives << list.map { |e|
			e.rect
		}
	end

	# This method renders a list of text hashes.
	# These hashes are expected within an array.
	# The extra nil check allows for rendering texts that may or may not exist yet.
	def self.quick_render_texts(array_of_text_hashes, args)
		return if array_of_text_hashes == nil
		args.outputs.labels << array_of_text_hashes.each
	end

end