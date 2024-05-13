# frozen_string_literal: true

require 'app/tomes/spells/geometry/location'
require 'app/tomes/spells/geometry/size'

# A module with methods that calculate various center points on a rectangle.
module Center
  # Calculates the vertical and horizontal center and returns that point as an array.
  # @return [Array<Integer, Integer>]
  def true_center
    [horizontal_center, vertical_center]
  end
  alias center true_center
  alias center_point true_center

  # The horizontal center coordinate.
  # @return Integer
  def horizontal_center
    x + (width / 2)
  end
  alias center_x horizontal_center

  # The vertical center coordinate.
  # @return Integer
  def vertical_center
    y + (height / 2)
  end
  alias	center_y vertical_center
end
