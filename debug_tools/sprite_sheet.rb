require 'app/tomes/geometry/location.rb'
require 'app/tomes/constants_and_defaults/simple_mood_hash.rb'
require 'app/tomes/colors/color.rb'

##
# A class that makes rendering a the Simple Mood sprite sheet easier.
# This class is used in some specific ways in the game I'm working on and has some esoteric properties. 
# These will be pointed out, as they may or may not be useful to your project.

class SpriteSheet
	extend Location

	HIDDEN_LOCATION = -256	# Used to hide this if the sprite sheet is constantly "rendered" to the screen.
	DEFAULT_LOCATION = [975, 100] # Puts it to the right side of the screen and towards the center vertically.
	DEFAULT_CELL_SIZE = 16
	SPRITE_SHEET_SIZE = 256

	@x = HIDDEN_LOCATION
	@y = HIDDEN_LOCATION
	@target_point = [0, 0]
	@target_cell = [0, 0]
	@active = false

	##
	# These methods deal with rendering/hiding the sheet and its current state.

	def self.active?
		@active
	end

	def self.activate!(point = DEFAULT_LOCATION)
		return if @active
		self.set_position!(point)
		@active = true
	end

	def self.deactivate!
		return if !@active
		self.set_position!(-1, -1)
		@active = false
	end

	# NOTE: Some of these are used in my game specifically. 
	# I'm leaving them here in case anyone else could find some use for them.
	# If they are not needed, remember to remove them from the data method as well.

	##
	# The top-right point of the sheet. 
	# (I use this for geometric purposes.)

	def self.opposite_point
		[ (SPRITE_SHEET_SIZE + @x), (SPRITE_SHEET_SIZE + @y) ]
	end

	##
	# This method returns the name of the targeted sprite.
	# The target position is passed as the grid value of each cell. i.e. [4, 7]

	def self.get_sprite_name(cell_point = @target_cell)
		SPRITE_HASH.key(cell_point)
	end

	##
	# This method sets the target point of the sprite_sheet.
	# The Sheet itself then uses that information to figure out which sprite is being looked at.
	# Whatever is targeting the sprite sheet calls this method.
	# It externally calculates where it is and then passes that point into the method as an array.
	# (I treat each cell as a rect, and have the Mouse pass in the literal position of that rect, for example.)
	# Using more than one targeter simultaneously leads to undefined behavior.

	def self.set_target_point!(point)
		@target_point = [point[0], (point[1] - 15).abs]
	end

	##
	# This method sets the target cell of the sprite_sheet.
	# This is used by the sheet and displayed as diagnostic information to show the current sprite's point.
	# Whatever is targeting the sprite sheet calls this method, and externally calculates the cell it's on.
	# This number is then passed into the method as an array.
	# Using more than one targeter simultaneously leads to undefined behavior.

	def self.set_target_cell!(point)
		@target_cell = [point[0], (point[1] - 15).abs]
	end

	##
	# This method sets up the output hash for the sprite sheet.
	# It should not be used directly.

	def self.output
		out = {
			x: @x, 
			y: @y, 
			w: SPRITE_SHEET_SIZE, 
			h: SPRITE_SHEET_SIZE, 
			tile_x: 0, 
			tile_y: 0, 
			tile_w: SPRITE_SHEET_SIZE, 
			tile_h: SPRITE_SHEET_SIZE, 
			path: SPRITE_PATH,
			r: 0,
			g: 0,
			b: 0,
			a: 256,
			primitive_marker: :sprite,
		}, 
		{
			x: @x,
			y: @y,
			w: SPRITE_SHEET_SIZE,
			h: SPRITE_SHEET_SIZE,
			primitive_marker: :border,
		}
		out
	end

	##
	# A default rect hash. 
	# (All extant objects in my game have this. It makes using the QuickRender tools easier.)

	def self.rect
		{
			x: @x,
			y: @y,
			w: SPRITE_SHEET_SIZE,
			h: SPRITE_SHEET_SIZE,
			primitive_marker: :border,
		}
	end

	##
	# This method returns the complete rendering hash for the SpriteSheet.

	def self.primitives
		output.flatten << diagnostic
	end

	##
	# A hash of data used as a substitute for getter methods. 
	# (My game uses this method to facilitate communication between various objects.)

	def self.data
		{
			position: self.position,
			dimensions: [256, 256],
			opposite_int: [self.opposite_point[0] - DEFAULT_CELL_SIZE, self.opposite_point[1] - DEFAULT_CELL_SIZE],
			target_point: @target_point,
			target_cell: @target_cell,
			opposite_point: self.opposite_point,
			unit: DEFAULT_CELL_SIZE,
			cell: @target_cell
		}
	end

	##
	# A list of diagnostic texts.
	# This is displayed as part of the final primitive output.
	# It includes a closeup of the currently selected sprite.

	def self.diagnostic 
		out = []
		out << {
			x: @x,
			y: @y - 5,
			text: "#{get_sprite_name}",
			primitive_marker: :label,
		}
		out << {
			x: @x,
			y: @y - 55,
			text: "Cell: #{@target_cell}",
			primitive_marker: :label,
		}
		out << {
			x: @x,
			y: @y - 30,
			text: "Int: #{@target_point}",
			primitive_marker: :label,
		}
		out << {
			x: @x + 192,
			y: @y - 65,
			w: 32,
			h: 32,
			path: DEFAULT_SPRITESHEET_PATH,
			tile_x: @target_point[0] - @x,
			tile_y: ((@target_point[1] + DEFAULT_CELL_SIZE - @y) - 241).abs, # Sprite internal Y coordinates are backwards in Dragon Ruby
			tile_w: DEFAULT_CELL_SIZE,
			tile_h: DEFAULT_CELL_SIZE,
			primitive_marker: :sprite,
		}.merge(Color.black)
	end
end