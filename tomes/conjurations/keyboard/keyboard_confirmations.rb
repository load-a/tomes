# frozen_string_literal: true

# A method for handling keyboard confirmation inputs.
module KeyboardConfirmations
  # Gives current confirmation-button presses as a list.
  # @return [Array]
  def confirm_button
    confirm_button_inputs.map do |key, value|
      key unless (value.intersection down_inputs).empty?
    end.compact
  end
  alias confirm confirm_button

  # Gives current confirmation-button holds as a list.
  # @return [Array]
  def confirm_button_held
    confirm_button_inputs.map do |key, value|
      key unless (value.intersection held_inputs).empty?
    end.compact
  end
  alias confirm_button_hold confirm_button_held
  alias confirm_hold confirm_button_held
  alias confirm_held confirm_button_held

  # Gives current confirmation-button releases as a list.
  # @return [Array]
  def confirm_button_up
    confirm_button_inputs.map do |key, value|
      key unless (value.intersection up_inputs).empty?
    end.compact
  end
  alias confirm_up confirm_button_up

  # Checks if a confirmation-button is currently pressed or held (down).
  # @return [Boolean]
  def confirm_button?
    !confirm_button_held.empty?
  end
  alias confirm? confirm_button?
end
