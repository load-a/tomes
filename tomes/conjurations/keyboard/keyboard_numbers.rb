# frozen_string_literal: true

require 'app/tomes/conjurations/keyboard/keyboard_numerals'

# A module for handling numeric Keyboard inputs.
# @note This module primarily deals with *numbers*
#   (such as "one", "two", "three", etc.) but it also includes
#   the module for dealing with numerals.
module KeyboardNumbers
  include KeyboardNumerals

  # Gives current number-button presses as a list of numbers.
  # @return [Array]
  def number
    down_inputs.select { |number, _numeral| number_inputs.include? number }
  end

  # Gives current number-button holds as a list of numbers.
  # @return [Array]
  def number_held
    held_inputs.select { |number, _numeral| number_inputs.include? number }
  end
  alias number_hold number_held

  # Gives current number-button releases as a list of numbers.
  # @return [Array]
  def number_up
    up_inputs.select { |number, _numeral| number_inputs.include? number }
  end

  # Checks if a number-button is currently pressed or held (down).
  # @return [Boolean]
  def number?
    down_or_held_inputs.any? { |number, _numeral| number_inputs.include? number }
  end
  alias numeral? number?
end
