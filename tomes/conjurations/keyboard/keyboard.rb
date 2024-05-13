# frozen_string_literal: true

require 'app/tomes/conjurations/keyboard/input_lists'
require 'app/tomes/conjurations/keyboard/full_keyboard'

# A module for handling Keyboard input.
module Keyboard
  extend ArgsUpdate
  extend InputLists
  extend FullKeyboard

  module_function

  # The raw list of current keyboard inputs.
  # @return [Array<Symbols>]
  def inputs
    args.inputs.keyboard.keys
  end
end
