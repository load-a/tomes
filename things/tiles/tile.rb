require 'app/tomes/things/tiles/tile_foundation.rb'
# A class for all environmental tiles in the game.

class Tile < TileFoundation
	# (see TileFoundation#initialize)
	def initialize(location, size, sprite)
		super
		self.type = :tile
	end

	# (see TileFoundation#creation_data)
	def creation_data
		"%08b%016b%016b%016b%016b%04b%04b%08b" % [ 2, location[0], location[1], size[0], size[0], number[0], number[1], color_id ]
	end

end