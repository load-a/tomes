require 'app/tomes/things/thing.rb'

require 'app/tomes/things/lattices/highlighter.rb'

require 'app/tomes/geometry/converter.rb'
require 'app/tomes/colors/colors.rb'

# This class handles all Grids in the game.
# @note 
# 		- When multiple grids overlap on screen, priority seems to be given to the leftmost one.
# 		- Setting @unit_length to a multiple of 16 seems to look best (other sizes can appear contorted).

class Lattice < Thing
	include Geometry
	include Colors

	private
	attr_writer :target_location, :target_cell, :unit_length, :converter, :highlighter, :unit_length

	# @param location (see Extant#initialize)
	# @param size_in_units [Array<Integer>] The Width and Height of the object measured by the Lattice's cell unit.
	# @example Lattice.new([50, 100], [7, 4], 128)
	def initialize(location, size_in_units = [16, 16], unit_length = 16)
		self.width, self.height = size_in_units.map {|measurement| measurement * unit_length}
		super(location, size)

		self.unit_length = unit_length
		self.converter = Converter.new(unit_length)
		self.highlighter = Highlighter.new(self)
		self.highlights = Hash.new(0)

		self.target_location = [0, 0]
		self.target_cell = [0, 0]

		self.type = :lattice
		self.color = Color.black
	end

	public
	attr_accessor :highlights
	attr_reader :unit_length, :target_cell, :target_location, :highlighter, :converter

	def creation_data
		"%08b%016b%016b%016b%016b%08b" % [ 1, location[0], location[1], size[0]/unit_length, size[1]/unit_length, unit_length ]
	end

	def unit_size
		[unit_length, unit_length]
	end

	# Used to inform the Lattice that a section of it is being targeted. It takes the target location and converts it into 
	# 	a target_cell and target_int.
	# @param location [Array<Integer>]
	# @return [Void]
	def notify_location(location)
		self.target_location = calculate_literal_location location
		self.target_cell = calculate_cell_location location
	end

	# Takes a set of absolute coordinates and converts them into the nearest cell's *literal* coordinates.
	# @param location [Array<Integer>]
	# @return [Array<Integer>]
	def calculate_literal_location(location)
		int_x = converter.absolute_to_interval(location[0], x)
		int_y = converter.absolute_to_interval(location[1], y)

		int_x = nil if int_x < x || int_x > right_side
		int_y = nil if int_y < y || int_y > top_side

		[int_x, int_y]
	end

	# Takes a set of absolute coordinates and converts them into the nearest cell's *relative* coordinates.
	# @param (see calculate_literal_location)
	# @return (see calculate_literal_location)
	def calculate_cell_location(location)
		cell_x = converter.absolute_to_cell(location[0], x)
		cell_y = converter.absolute_to_cell(location[1], y)

		cell_x = nil if cell_x < 0 || cell_x > right_side / unit_length
		cell_y = nil if cell_y < 0 || cell_y > top_side / unit_length

		[cell_x, cell_y]
	end

	# The apex coordinates converted to their interval values.
	# @return [Array<Integer>]
	def apex_int
		[converter.absolute_to_interval(right_side-1, x), converter.absolute_to_interval(top_side-1, y)]
	end

	# This first notifies the Lattice that a certain point has been targeted. 
	# 	It uses this information to generate the correct highlight.
	# @param location [Array<Integer>]
	# @return [Void]
	def update_highlights(location)
		notify_location(location)
		return deactivate_highlights if target_location.any? nil
		self.highlights = highlighter.highlights(target_location)
	end
	alias activate_highlights update_highlights

	# Clears the highlight primitive hashes.
	# @return [Void]
	def deactivate_highlights
		return if highlights.empty?
		self.highlights = {}
	end

	def highlight_mode=(mode)
		highlighter.mode = mode
	end

	# (see Thing#info)
	def info
		super << {
			target_location: target_location,
			target_cell: target_cell,
			unit_length: unit_length,
		}
	end

	# Diagnostic values that can be rendered to the screen with the Lattice itself.
	# @return [Hash]
	def diagnostics
		[
			{
				x: x,
				y: y,
				text: target_cell
			},
			{
				x: x + target_cell.to_s.length * 10,
				y: y,
				text: target_location
			},
			{
				x: width/2 + x,
				y: y,
				text: unit_length.to_s + 'p'
			},
			{
				x: right_side - apex.to_s.length * 10,
				y: y,
				text: apex.to_s
			},
			{
				x: right_side - (apex.to_s.length * 2) * 10,
				y: y,
				text: apex_int.to_s
			}
		]
		# 10 is the assumed font width
	end

	# @return [Hash]
	def primitives
		super[:primitive_marker] = :border
		[super, (highlights unless highlights.empty?)].reverse
	end

end