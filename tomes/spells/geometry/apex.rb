# frozen_string_literal: true

require 'app/tomes/spells/geometry/location'
require 'app/tomes/spells/geometry/size'

# This module contains methods for an rectangle's geometric summit, or "apex" (the point farthest away from its origin).
# For example: a square of length 10 located at point (0, 0)-\-that is, its bottom-left corner is at that point-\-
# 	will have an apex of (10, 10).
module Apex
  # The point farthest away from a rectangle's base.
  # @return [Array<Integer, Integer>]
  def apex
    [apex_x, apex_y]
  end
  alias summit apex

  # The X coordinate farthest away from its base.
  # @return Integer
  def apex_x
    x + width
  end

  # The Y coordinate farthest away from its base.
  # @return Integer
  def apex_y
    y + height
  end
end
