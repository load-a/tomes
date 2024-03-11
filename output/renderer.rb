require 'app/tomes/input/args_object.rb'
require	'app/windows/window.rb'
require 'app/tomes/things/lattices/lattice.rb'
require 'app/tomes/things/tiles/actor.rb'
require 'app/tomes/things/tiles/tile.rb'

class Renderer < ArgsObject
	@@all = []

	@@layer_order = [:background, :midground, :foreground]
	@@element_order = [:background_element, :foreground_element, :border]
	# Symbols represent classes that have not been implemented yet
	@@class_order = [:Tooltip, Window, :Menu, Lattice, :TextBox, Actor, Tile, :Background].reverse

	class << self

		def all
			@@all
		end

		def add(object)
			return if all.include? object
			@@all << object
		end

		def remove(object)
			@@all.delete(object)
		end

		def sort!
			# Sort by Layer, class then element
		end

		def all_primitives
			sort!
			all.map { |object| 
				if object.respond_to?('primitives')
					object.primitives 
				else
					object.rect
				end
			}
		end

		def render
			@args.outputs.primitives << all_primitives
		end

	end
end