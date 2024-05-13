# frozen_string_literal: true

require 'app/tomes/conjurations/keyboard/keyboard_letters'
require 'app/tomes/conjurations/keyboard/keyboard_numbers'
require 'app/tomes/conjurations/keyboard/keyboard_directions'
require 'app/tomes/conjurations/keyboard/keyboard_buttons'
require 'app/tomes/conjurations/keyboard/keyboard_confirmations'

# A module bringing together all other input modules, as well as some generalized methods of its own.
# @note Numbers are the default way numeric inputs are listed.
module FullKeyboard
  include KeyboardLetters
  include KeyboardNumbers
  include KeyboardDirections
  include KeyboardButtons
  include KeyboardConfirmations

  # Gives current key presses as a list.
  # @return [Array]
  def down_inputs
    inputs[:down].reject { |key| key == :raw_key or key.to_s.include? 'scancode' or key.to_s.include? 'char' }
  end

  # Gives current key releases as a list.
  # @return [Array]
  def up_inputs
    inputs[:up].reject { |key| key == :raw_key or key.to_s.include? 'scancode' or key.to_s.include? 'char' }
  end

  # Gives current key holds as a list.
  # @return [Array]
  def held_inputs
    inputs[:held].reject { |key| key == :raw_key or key.to_s.include? 'scancode' or key.to_s.include? 'char' }
  end

  # Gives current key presses and holds as a list.
  # @return [Array]
  def down_or_held_inputs
    inputs[:down_or_held].reject { |key| key == :raw_key or key.to_s.include? 'scancode' or key.to_s.include? 'char' }
  end

  # Checks if a key is currently pressed or held (down).
  # @return [Boolean]
  def inputs?
    !held_inputs.empty?
  end
end
