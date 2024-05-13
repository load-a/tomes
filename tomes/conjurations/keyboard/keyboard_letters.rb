# frozen_string_literal: true

# A module for dealing with keyboard inputs which are not numbers or directional arrows.
# This set of buttons are generally referred to as "letters", despite punctuation and other keys also being included.
module KeyboardLetters
  # Gives current letter-button presses as a list.
  # @return [Array]
  def letter
    down_inputs.select { |key| letter_inputs.include? key }
  end

  # Gives current letter-button holds as a list.
  # @return [Array]
  def letter_held
    held_inputs.select { |key| letter_inputs.include? key }
  end
  alias letter_hold letter_held

  # Gives current letter-button releases as a list.
  # @return [Array]
  def letter_up
    up_inputs.select { |key| letter_inputs.include? key }
  end

  # Checks if a letter button is currently pressed or held (down).
  # @return [Boolean]
  def letter?
    letter_inputs.any? down_or_held_inputs
  end
end
