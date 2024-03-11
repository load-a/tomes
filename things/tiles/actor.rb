require 'app/tomes/things/tiles/tile_foundation.rb'
require 'app/tomes/constants/constants.rb'
require 'app/tomes/constants/character_sheet.rb'

# A class for all characters in the game.

class Actor < TileFoundation

	# (see Thing#initialize)
	# @param character_sheet_symbol [Symbol] The key of CHAR_TABLE that references this character.
	def initialize(location, size, character_sheet_symbol)
		size = [size, size] if size.kind_of? Numeric
		@sheet = CHAR_TABLE[character_sheet_symbol]
		super(location, size, @sheet[:letter])
		@type = :actor

		@sprite.change_color!(Color.dark_green)
		@sprite.save_color!

		@range_x = SCREEN_RANGE_X
		@range_y = SCREEN_RANGE_Y
	end

	# (see TileFoundation#creation_data)
	def creation_data
		"%08b%016b%016b%016b%016b%08b" % [ 3, location[0], location[1], size[0], size[0], @sheet[:name][0].bytes[0] ]
	end

	# Checks if the provided coordinates are withing the character's movement range.
	# @param location [Array<Integer>] The coordinates being checked.
	def within_limits_at?(location)
		(@range_x.include? location[0]) && (@range_y.include? location[1])
	end

	def character_data
		"%<name>s: %<max_hp>i" % @sheet
	end
end