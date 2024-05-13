# frozen_string_literal: true

# A module for calculating the position of one object in relation to another.

module Position
  module_function

  # Checks if two objects collide.
  # @param primary_object [Object]
  # @param secondary_object [Object]
  # @return [Boolean]
  def these_collide?(primary_object, secondary_object)
    primary_object.top > secondary_object.bottom and
      primary_object.left < secondary_object.right and
      primary_object.bottom < secondary_object.top and
      primary_object.right > secondary_object.left
  end
  alias collide? these_collide?

  # Subtracts one set of coordinates from the other.
  # @param first_coordinates [Array<Integer, Integer>]
  # @param second_coordinates [Array<Integer, Integer>]
  # @return [Array<Integer, Integer>] The difference between the two.
  def subtract_coordinates(first_coordinates, second_coordinates)
    [first_coordinates[0] - second_coordinates[0], first_coordinates[1] - second_coordinates[1]]
  end

  # Adds one set of coordinates to the other.
  # @param first_coordinates [Array<Integer, Integer>]
  # @param second_coordinates [Array<Integer, Integer>]
  # @return [Array<Integer, Integer>] The sum of the two.
  def add_coordinates(first_coordinates, second_coordinates)
    [first_coordinates[0] + second_coordinates[0], first_coordinates[1] + second_coordinates[1]]
  end

  # Calculates a point left of the object (along the X-axis only), including an optional spacing parameter.
  # 	(This method does not assume the object includes the Apex module.)
  # @param object [Object]
  # @param spacing [Integer]
  # @return Integer
  def left_of(object, spacing: 1)
    object.x - spacing
  end

  # Calculates a point right of the object (along the X-axis only), including an optional spacing parameter.
  # 	(This method does not assume the object includes the Apex module.)
  # @param object [Object]
  # @param spacing [Integer]
  # @return Integer
  def right_of(object, spacing: 1)
    object.x + object.width + spacing
  end

  # Calculates a point above the object (along the Y-axis only), including an optional spacing parameter.
  # 	(This method does not assume the object includes the Apex module.)
  # @param object [Object]
  # @param spacing [Integer]
  # @return Integer
  def above(object, spacing: 1)
    object.y + object.height + spacing
  end

  # Calculates a point below the object (along the Y-axis only), including an optional spacing parameter.
  # 	(This method does not assume the object includes the Apex module.)
  # @param object [Object]
  # @param spacing [Integer]
  # @return Integer
  def below(object, spacing: 1)
    object.y - spacing
  end
end
