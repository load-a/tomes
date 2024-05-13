# frozen_string_literal: true

# Provides some methods for obtaining information about a hand.
module HandInformation
  # Returns the length of #cards.
  # @return [Integer]
  def length
    cards.length
  end

  # Checks if #cards is empty.
  # @return [Boolean]
  def empty?
    cards.empty?
  end

  # Checks if #cards includes the provided Card.
  # @param this [Card]
  # @return [Boolean]
  def include?(this)
    cards.include?(this)
  end

  # Checks if the number of cards meets or exceeds a given threshold.
  # @param threshold [Integer] Optional; defaults to 1.
  # @return [Boolean]
  def full?(threshold = 1)
    length >= threshold
  end
end
