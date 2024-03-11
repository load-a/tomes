require 'app/tomes/colors/colors.rb'
require 'app/tomes/geometry/movement.rb'
require 'app/tomes/constants/constants.rb'
require 'app/tomes/constants/sprite_hash.rb'
require 'app/tomes/things/thing.rb'

# The class for all visual sprites in the game.
# Sprite images are determined by their coordinates on the SpriteSheet. This is best used as an array, however constants and 
# 	Hash keys can also be used to make development easier. These traits are expressed with the #name and #number attributes.
# 	A Sprite's name is the symbol used to look it up in the SPRITE_HASH. Its number are the coordinates those names access.
# 	Sprites are not meant to exist outside of a master object. This makes creating and destroying them both easier:
# 	instead of tracking them separately, in tandem, only the master object needs to be managed. 
# 	The sprite image is changed through the #change_name! method.)

class Sprite < Thing
	include Colors
	include Movement

	private
	attr_accessor :sprite, :name, :number, :color, :master

	def initialize(location, size, sprite_name)
		super(location, size)
		self.type = :sprite
		self.name = sprite_name
		self.number = [0,0]
		self.color = Color.dark_blue
		self.master = nil
		self.sprite = {:generate => 'failed'}

		generate_sprite
	end

	# Parses the sprite name and generates the appropriate rendering hash for it.
	# @return [Void]
	def generate_sprite
		parse_name
		self.sprite = {
				x: x,
				y: y,
				w: w,
				h: h,
				path: SPRITE_PATH,
				tile_x: number[0] * DEFAULT_CELL_SIZE,
				tile_y: number[1] * DEFAULT_CELL_SIZE,
				tile_w: 16,
				tile_h: 16,
				primitive_marker: :sprite,
				a: @alpha,
			}.merge(@color)
	end

	# Sets the appropriate sprite reference from #name. 
	# 	Accommodates Symbols and coordinates in the form of an integer Array.
	# @return [Void]
	def parse_name
		if name.class == Symbol
			self.number = SPRITE_HASH[name] || invalid_name
		else
			number = @name
			self.name = SPRITE_HASH.key(name)
		end
	end

	# Creates a sprite to signify an invalid sprite name has been given.
	# @note This is only meant for testing and development.
	def invalid_name
		self.color = Color.cyan
		SPRITE_HASH[:inv_question_mark]
	end

	public 

	# @!attribute name 
	# 	The label attributed to the Sprite image.
	# 	@return [Symbol]
	# @!attribute number 
	# 	An Array with the coordinates for the sprite image location on the SpriteSheet.
	# 	@return [Array<Integer>]
	# Sets the object the sprite is attached to.
	# @return [Thing]
	attr_reader :name, :number, :master

	# Sets the object that the sprite is attached to. This is done at the master object's initialization.
	# @return [Void]
	def set_master!(new_master)
		self.master = new_master
	end

	# Changes the name attribute for the sprite. 
	# 	The next time the sprite generator is called it will parse this name and update the sprite.
	# @param new_sprite [Symbol, Array<Integer>]
	# @return [Void]
	def change_name!(new_sprite)
		self.name = new_sprite
		parse_name
	end

	def primitives
		generate_sprite
		sprite
	end

	def info
		super << {
			name: name,
			number: number,
			master: master.id
		}
	end
end

# NOTE: Ok so this is a lot...
#		- Sprites are displayed to the screen by referencing an image, in this case a png of a whole sprite sheet.
# 	- The dimensions :x, :y, :w, and :h all do what you would expect.
# 	- Keep in mind that :x and :y are the bottom-left corner of the sprite.
# 	- The :tile dimensions work a bit differently:
# 	- Because :path is just calling an image file (which in this case is a full sprite sheet), 
# 			these dimensions control what part of that image we can see. 
# 	- :tile_x and :tile_y control position of the "camera"--or what part of the entire sheet is being looked at--
# 	  	originating from the top-left corner and looking "down-right" (based on the next two dimensions).
# 	- :tile_h and :tile_w are the field of view--how much of the image the camera is looking at.
# 	- Therefore, it can be said that :tile_x and :tile_y control the "where", 
# 	  	while :tile_w and :tile_h control the "what".
# 	- (This effect could be used to emulate the way old consoles like the SNES handled map images.)
# 	- The tile dimensions cannot change the reference image in any way. If the image is 256 x 256, 
# 			setting :tile_w to 512 will just expand the field of view past the image, doing nothing.
# 	- The tile dimensions are based on the absolute dimensions of the file :path is pointing to. This is the raw image.
# 	- The regular dimensions are the on-screen dimensions of whatever the raw image happens to be--the processed image.
