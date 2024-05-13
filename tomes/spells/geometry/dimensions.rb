# frozen_string_literal: true

require 'app/tomes/spells/geometry/location'
require 'app/tomes/spells/geometry/size'
require 'app/tomes/spells/geometry/apex'
require 'app/tomes/spells/geometry/center'

# A method for handling some basic properties of a rectangle.
module Dimensions
  include Location
  include Size
  include Apex
  include Center

  # Returns the #dimensions of a rectangle, along with a default border `primitive_marker` to help DragonRuby render it.
  # @return [Hash]
  def rect
    dimensions.merge({ primitive_marker: :border })
  end

  # Returns a has with the X and Y coordinates of a rectangle, along with its width and height.
  # @return [Hash]
  def dimensions
    {
      x: x,
      y: y,
      w: width,
      h: height
    }
  end

  # Sets the location and size of a rectangle.
  # @param location [Array<Integer, Integer>]
  # @param size [Array<Integer, Integer>]
  # @return [Void]
  def change_dimensions(location, size)
    set_location location
    set_size size
  end
  alias set_dimensions change_dimensions

  alias bottom_side y
  alias bottom y

  alias left_side x
  alias left x

  alias right_side apex_x
  alias right apex_x

  alias top_side apex_y
  alias top apex_y
end
