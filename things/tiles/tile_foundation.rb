require 'app/tomes/things/thing.rb'
require 'app/tomes/things/tiles/sprite_connection.rb'
# require 'app/tomes/things/tiles/sprite.rb' <<- implicit in sprite_connection

# A class which encompasses tile-based objects.
# @note This class is used in prototyping but in production all tiles will either be Actors or Tiles

class TileFoundation < Thing
	include SpriteConnection

	attr_writer :sprite

	# @param sprite [Symbol] The sprite's name to be used as a key in the SPRITE_HASH.
	def initialize(location, size, sprite = :none)
		super(location, size)
		self.sprite = Sprite.new(location, size, sprite)
		self.type = :tile_foundation

		self.sprite.save_color!
		self.sprite.set_master!(self)
	end

	public
	attr_reader :sprite

	def sprite_name
		sprite.name
	end
	alias name sprite_name

	def sprite_number
		sprite.number
	end
	alias number sprite_number

	def color_id
		sprite.get_color_id
	end

	def info
		super << {
			name: name,
			sprite_number: sprite.number
		}
	end

	def diagnostics
		"%s: [%d, %d] | %s #%s" % [@type.to_s[0].upcase, x, y, @sprite.name, @sprite.number]
	end
end