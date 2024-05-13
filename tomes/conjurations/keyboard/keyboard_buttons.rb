# frozen_string_literal: true

# A method for handling controller-style inputs on the Keyboard.
module KeyboardButtons
  # Gives current controller-style-button presses as a list.
  # @return [Array]
  def button
    button_inputs.map do |key, value|
      key unless (value.intersection down_inputs).empty?
    end.compact
  end

  # Gives current controller-style-button holds as a list.
  # @return [Array]
  def button_held
    button_inputs.map do |key, value|
      value = [value] unless value.is_a? Array
      key unless (value.intersection held_inputs).empty?
    end.compact
  end
  alias button_hold button_held

  # Gives current controller-style-button releases as a list.
  # @return [Array]
  def button_up
    button_inputs.map do |key, value|
      key unless (value.intersection up_inputs).empty?
    end.compact
  end

  # Checks if a controller-style-button is currently pressed or held (down).
  # @return [Boolean]
  def button?
    !button_held.empty?
  end
end
