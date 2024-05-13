# frozen_string_literal: true

# A module for handling mouse input.
# @note Mouse.update must be called every tick you wish to use this class.
module Mouse
  extend ArgsUpdate
  extend Location

  module_function

  # see ArgsUpdate::update
  # Updates mouse position too.
  def update(args)
    super
    self.x = args.inputs.mouse.x.to_i
    self.y = args.inputs.mouse.y.to_i
  end

  # Check if the left mouse button  was clicked this frame.
  # @return [Boolean]
  def click?
    args.inputs.mouse.click ? true : false
  end

  # Check if the left mouse button is being held.
  # @return [Boolean]
  def held?
    args.inputs.mouse.held ? true : false
  end
  alias hold? held?

  # Checks if the left mouse button was released this frame.
  # @return [Boolean]
  def up?
    args.inputs.mouse.up ? true : false
  end

  # Checks if the Mouse cursor is intersecting a given rectangle.
  # 	This method uses `args` to do this calculation.
  # @note I cant figure out how to resolve nil errors without a 'rescue' statement.
  # 	DragonRuby is no help in this regard either.
  # @param thing [Object] This object must respond to #rect.
  # @return [Boolean]
  def on?(thing)
    args.inputs.mouse.intersect_rect? thing.rect
  rescue StandardError
    false
  end

  # Cycles through the given list of Objects and sees if the Mouse intersects with any of them.
  # @param list [Array<Objects>] A list of objects which all must respond to #rect.
  # @return [Boolean]
  def on_something_in?(list)
    list.map { |thing| on?(thing) }.include? true
  end

  # Checks the given list and returns the final object with which the Mouse intersects.
  # 	This works in conjunction with .sees_in_list.
  # 	For example, if the cursor is over a bunch of overlapping items,
  # 	the topmost of them (the last one in the '.sees_in_list array') will be the one returned in this method.
  # @param list [Array<Objects>] A list of objects which all must respond to #rect.
  # @return Object This is the last element in the list for which 'Mouse.on?' is true.
  def sees(list)
    sees_in_list(list).last
  end

  # Checks the given list and returns all of the objects with which the Mouse intersects.
  # @param list [Array<Objects>] A list of objects which all must respond to #rect.
  # @return [Array<Objects>]
  def sees_in_list(list)
    list.map { |thing| thing if on?(thing) }.flatten.compact
  end
  alias sees_in sees_in_list

  # Gives an abbreviated look at which Mouse button actions are being performed.
  # @return [String] A string of binary digits representing the following actions: "click", "hold", "up".
  def binary_signals
    click = click? ? 1 : 0
    hold = hold? ? 1 : 0
    up = up? ? 1 : 0

    format('%d%d%d', click, hold, up)
  end

  # A line of text that shows the current state of the Mouse.
  # @return [String] The Mouse location and binary signals.
  def to_s
    format('Mouse: %04d-%03d-%s', x, y, binary_signals)
  end

  # A hash that shows the current state of the Mouse.
  # @return [Hash]
  def to_h
    {
      self: 'Mouse',
      location: location,
      click: click?,
      down: hold?,
      up: up?
    }
  end

  # The current mouse state as a combined decimal/binary integer.
  # @return [Integer] X coordinate, Y coordinate and binary signals concatenated with no separations or leading zeros.
  def to_i
    format('%04d%04d%s', x, y, binary_signals).to_i
  end
end
