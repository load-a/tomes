# frozen_string_literal: true

# A module for dealing with an object's height (occasionally called "length") and width.
# 	It is recommended you use #width and #height instead of #w or #h.

module Size
  # @!attribute [r] width
  # 	The object's length along the X-axis.
  # @!attribute [r] height
  # 	The object's length along the Y-axis.
  attr_accessor :width, :height

  alias w width	# These two are aliased so because DragonRuby checks
  alias h height	# specifically for #w and #h in some methods.

  # Sets the width and height.
  # @param new_size [Array<Integer, Integer>]
  # @return [Void]
  def size=(new_size)
    self.width, self.height = new_size
  end

  # Adds the size_offset[0, 1] to the width and height respectively.
  # @param size_offset [Array<Integer, Integer>]
  # @return [Void]
  def adjust_size(size_offset)
    self.width += size_offset[0]
    self.height += size_offset[1]
  end
  alias grow adjust_size

  # Returns an array containing the object's width and height attributes.
  # @return [Array<Integer, Integer>]
  def size
    [width, height]
  end
  alias proportions size
end
