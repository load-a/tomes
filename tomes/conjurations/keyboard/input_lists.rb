# frozen_string_literal: true

# A module containing all the sets of input presses used by the Keyboard class and its modules.
module InputLists
  # A list of alphabet symbols.
  # @return [Array<Symbols>]
  def alphabet
    %i[
      a b c d e f g
      h i j k l m n o p
      q r s
      t u v
      w x
      y z
    ]
  end

  # A list of common_punctuation symbols.
  # @return [Array<Symbols>]
  def common_punctuation
    %i[
      comma period exclamation_mark question_mark colon semicolon
      less_than greater_than equal
      space enter shift tab backspace
    ]
  end

  # A list of uncommon_punctuation symbols.
  # @return [Array<Symbols>]
  def uncommon_punctuation
    %i[
      meta alt control
      forward_slash back_slash
    ]
  end

  # A list of enclosing_punctuation symbols.
  # @return [Array<Symbols>]
  def enclosing_punctuation
    %i[
      open_square_brace close_square_brace open_round_brace close_round_brace
      single_quotation_mark double_quotation_mark
    ]
  end

  # Any key that is not a number or directional arrow.
  # @return [Array]
  def letter_inputs
    alphabet +
      common_punctuation +
      uncommon_punctuation +
      enclosing_punctuation
  end

  # All ten number keys as a hash.
  # @return [Hash] The hash keys are "numbers" and their values are "numerals".
  def number_inputs
    {
      one: 1, two: 2,
      three: 3, four: 4,
      five: 5, six: 6,
      seven: 7, eight: 8,
      nine: 9, zero: 0
    }
  end

  # The directional arrows or WASD keys as a hash of arrays containing both options.
  # @return [Hash<Array>] The hash keys are the directions and their values are arrays.
  # 	The first element in the array is the arrow key; the second is its WASD counterpart.
  def direction_inputs
    {
      up: %i[up_arrow w],
      down: %i[down_arrow s],
      left: %i[left_arrow a],
      right: %i[right_arrow d]
    }
  end

  # All controller-style buttons as a Hash with mixed values.
  # @note Directions are included.
  # @return [Hash] The hash keys are the reference input (such as on a Nintendo controller).
  # 	The values are the accepted key or array of keys for said input.
  def button_inputs
    {
      A: %i[c j],
      B: %i[x k],
      X: %i[z l],
      Y: %i[shift semicolon],
      START: :enter,
      SELECT: :space
    }.merge(directions)
  end

  # A hash of common confirm/deny buttons.
  # @return [Hash] The hash keys are the reference input, stated as "yes" or "no".
  # 	The values are arrays of accepted keys for said input.
  def confirm_button_inputs
    {
      yes: %i[j enter c],
      no: %i[k x]
    }
  end

  # All other lists in this module merged into one.
  # @note This method has not been tested!
  # @return [Hash]
  def keys
    letter_inputs.to_h + number_inputs + direction_inputs + button_inputs + confirm_button_inputs
  end
end
