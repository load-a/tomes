# frozen_string_literal: true

require 'app/tomes/components/deck_builder/hand'

# A Hand that uses and generates other Hands
class Deck < Hand
  VALID_REFERENCES = [Integer, Range, Symbol].freeze

  private

  attr_accessor :hands

  def initialize(initial_cards)
    super(initial_cards)
    self.hands = {
      draw: Hand.new(initial_cards),
      discard: Hand.new
    }
  end

  # A component method to `#[]`.
  def sort_references(references)
    references.sort_by! { |reference| VALID_REFERENCES.index(reference.class) }
  end

  public

  # Returns both Cards via their indices in #cards and Hands via their key in #hands.
  #   Both can be referenced in a single call.
  # @param references [Integer, Range, Symbol] Integers and Ranges will return cards; Symbols will return Hands.
  # @return [Array] The array will always be sorted as [Cards, Hands]
  def [](*references)
    results = sort_references(references).map do |reference|
      if reference.is_a?(Integer) || reference.is_a?(Range)
        cards[reference]
      elsif reference.is_a? Symbol
        hands[reference]
      end
    end

    results.flatten
  end

  # Deals the provided number of cards to the provided number of hands.
  # @param number_of_hands [Integer]
  # @param number_of_cards [Integer] Optional; defaults to 5.
  def generate_hands(number_of_hands, number_of_cards = 5)
    Array.new(number_of_hands) { Hand.new(deal(number_of_cards)) }
  end

  # Removes and returns the topmost card in the draw stack.
  # @param [number_of_cards] Optional; defaults to 1.
  # @return [Card, Array]
  def deal(number_of_cards = 1)
    hands[:draw].pop(number_of_cards)
  end

  # Deals cards to the provided hands.
  # @param hands [Hands]
  # @param number_of_cards [Integer] Optional keyword argument; defaults to 1.
  def deal_to(*hands, number_of_cards: 1)
    hands.each { |hand| hand.draw(deal(number_of_cards)) }
  end
end
