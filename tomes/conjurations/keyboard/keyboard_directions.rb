# frozen_string_literal: true

# A module for dealing with directional Keyboard inputs. The arrow keys and WASD are supported.
module KeyboardDirections
  # Gives current direction-button presses as a list.
  # @return [Array]
  def direction
    direction_inputs.map do |key, value|
      key unless (value.intersection down_inputs).empty?
    end.compact
  end

  # Gives current direction-button holds as a list.
  # @return [Array]
  def direction_held
    direction_inputs.map do |key, value|
      key unless (value.intersection held_inputs).empty?
    end.compact
  end
  alias direction_hold direction_held

  # Gives current direction-button releases as a list.
  # @return [Array]
  def direction_up
    direction_inputs.map do |key, value|
      key unless (value.intersection up_inputs).empty?
    end.compact
  end

  # Checks if a direction-button is currently pressed or held (down).
  # @return [Boolean]
  def direction?
    !direction_held.empty?
  end
end
