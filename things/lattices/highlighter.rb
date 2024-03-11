require 'app/tomes/colors/colors.rb'

# A class that creates highlights for the Lattice class.

class Highlighter
	include Colors

	private
	attr_writer :size, :base, :apex, :unit_length

	# @param master [Thing] The object the highlighter belongs to.
	def initialize(master)

		# @note The reason this is in binary will become clear in #highlights.
		self.mode = 0b100

		self.size = master.size
		self.base = master.base
		self.apex = master.apex
		self.unit_length = master.unit_length
		self.color = Color.blue

	end

	public
	attr_reader :size, :base, :apex, :unit_length
	attr_accessor :mode, :color

	# A box outline.
	# @return [Hash]
	def box(location)
		{
			x: location[0],
			y: location[1],
			h: unit_length,
			w: unit_length,
			primitive_marker: :border
		}.merge(color)
	end

	# Two bars whose intersection marks the targeted cell.
	# @return [Hash]
	def bars(location)
		[
			{
				x: base[0],
				y: location[1],
				w: size[0],
				h: unit_length,
				a: 64,
				primitive_marker: :solid
			}.merge(color),
			{
				x: location[0],
				y: base[1],
				w: unit_length,
				h: size[1],
				a: 64,
				primitive_marker: :solid,
			}.merge(color)
		]
	end

	# Two lines whose intersection marks the center of the targeted cell.
	# @return [Hash]
	def lines(location)
		[
			{
				x: base[0],
				x2: apex[0] - 1,
				y: location[1] + unit_length / 2,
				y2: location[1] + unit_length / 2,
				primitive_marker: :line
			}.merge(color),
			{
				x: location[0] + unit_length / 2,
				x2: location[0] + unit_length / 2,
				y: base[1] + 1,
				y2: apex[1] - 1,
				primitive_marker: :line
			}.merge(color)
		]
	end

	# Returns the appropriate highlight based on the mode.
	# @return [Hash]
	def highlights(location)
		case mode
		when 0b001
			[bars(location)]
		when 0b010
			[lines(location)]
		when 0b011
			[bars(location), lines(location)]
		when 0b100
			[box(location)]
		when 0b101
			[box(location), bars(location)]
		when 0b110
			[box(location), lines(location)]
		when 0b111
			[box(location), bars(location), lines(location)]
		else
			# @note This should never happen.
			{
				x: 0,
				y: 0,
				h: 0,
				w: 0,
				primitive_marker: :solid
			}
		end
	end
end