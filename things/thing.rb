require 'app/tomes/geometry/geometry.rb'
require 'app/tomes/level_managment/level.rb'
require 'app/tomes/level_managment/selector.rb'


# This is the Ancestor class to all extant objects in the game. It is never created directly.

class Thing
	include Geometry

	@@id_count = 0
	# Used to generate ID's for all descendants
	# @return [Integer]

	private
	attr_writer :type

	# @param location [Array<Integer>] The object's X and Y coordinates.
	# @param size [Array<Integer>] The object's Width and Height.
	def initialize(location, size)
		@thing_number = @@id_count.to_s
		self.type = :thing
		set_dimensions!(location, size)

		Level.all << self unless (self.kind_of?(Sprite) || self.kind_of?(Selector)) # Sprites are excluded because they are attached to other objects
		@@id_count += 1
	end

	public
	attr_reader :type

	def id
		"%03d%s" % [@thing_number, type.to_s[0].upcase]
	end

	# Some basic information in Hash form. May be useful for development.
	# @return [Hash]
	def info
		{
			self: self,
			id: id,
			type: type,
			location: location,
			size: size,
		}
	end

	# @return [String]
	def formatted_info
		"%<id>s: loc: %<location>s, size: %<size>s" % info
	end

	# This will be called on all kinds of Things for rendering purposes.
	# @return [Hash]
	# @note All objects that will actually get rendered have their own #primitives implementations. 
	# 	This one here is just a default version.
	def primitives
		{ :primitive_marker => :border }.merge(dimensions)
	end

end

# @note This is here to prevent a circular dependency.
class Sprite < Thing; end 