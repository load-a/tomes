# frozen_string_literal: true

# A module for dealing with an object's location in 2D space.

module Location
  # @!attribute [rw] x
  # 	The X coordinate.
  # @!attribute [rw] y
  # 	The Y coordinate.
  attr_accessor :x, :y

  # Sets the X and Y attributes.
  # @param new_location [Array<Integer, Integer>] The new X and Y values.
  # @return [Void]
  def location=(new_location)
    self.x, self.y = new_location
  end
  alias change_location location=

  # Adds the X and Y values (indices 0 and 1) to the X and Y attributes, respectively.
  # @param location_offset [Array<Integer, Integer>] The X and Y offset values.
  # @return [Void]
  def adjust_location(location_offset)
    self.x += location_offset[0]
    self.y += location_offset[1]
  end
  alias move adjust_location

  # Returns an array of the object's X and Y coordinates.
  # @return [Array<Integer, Integer>]
  def location
    [x, y]
  end
  alias point location
end
