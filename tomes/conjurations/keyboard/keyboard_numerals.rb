# frozen_string_literal: true

# A module for handling numeric Keyboard inputs.
# @note This module deals with *numerals* like "1", "2", "3" etc.
module KeyboardNumerals
  # Gives current number-button presses as a list of numerals.
  # @return [Array]
  def numeral
    down_inputs.select { |number, _numeral| number_inputs.include? number }.map { |number| number_inputs[number] }
  end

  # Gives current number-button holds as a list of numerals.
  # @return [Array]
  def numeral_held
    held_inputs.select { |number, _numeral| number_inputs.include? number }.map { |number| number_inputs[number] }
  end
  alias numeral_hold numeral_held

  # Gives current number-button releases as a list of numerals.
  # @return [Array]
  def numeral_up
    up_inputs.select { |number, _numeral| number_inputs.include? number }.map { |number| number_inputs[number] }
  end
end
