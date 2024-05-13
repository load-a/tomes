# frozen_string_literal: true

require 'app/tomes/spells/geometry/dimensions'

# A module for giving an object the properties of a rectangle.
module Rectangle
  include Dimensions

  # Calculates the perimeter of this rectangle.
  # @return [Integer]
  def perimeter
    (width * 2) + (height * 2)
  end

  # Calculates the area of this rectangle.
  # @return [Integer]
  def area
    width * height
  end

  # Calculates the hypotenuse of this rectangle's diagonal.
  # @return [Integer]
  def hypotenuse
    Math.sqrt((width**2) + (height**2)).round(0o2)
  end
end
