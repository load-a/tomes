# frozen_string_literal: true

require 'app/tomes/components/deck_builder/card'
require 'app/tomes/components/deck_builder/hand'
require 'app/tomes/components/deck_builder/deck'

# A Hand with the ability to generate a base set of Cards.
# 	Games should only use one box of cards.
class BoxOfCards < Hand
  private

  def initialize(number_of_cards, &block)
    super()
    make_cards(number_of_cards, &block)
  end

  public

  # Creates the given number of default Cards and adds them to the list.
  #   A block can be provided to immediately operate on each new Card.
  #   This block is equivalent to calling #each on an array of all the Cards that were just generated.
  # @param quantity [Integer] Optional; defaults to 1.
  # @return [Void]
  def make_cards(quantity = 1)
    new_cards = Array.new(quantity) { Card.new }

    new_cards.each_with_index do |card, index|
      yield(card, index) if block_given?
    end

    self.cards += new_cards
    new_cards
  end

  # Copies the provided Card or Array of Cards a number of times then adds it to #cards.
  # @param dup_cards [Card, Array<Cards>] Optional; defaults to #cards.
  # @return [Void] Optional; defaults to 1.
  def copy_and_add(dup_cards = self.cards, number_of_times = 1)
    self.cards += copy(dup_cards, number_of_times)
  end
  alias duplicate copy_and_add

  # Returns a number of copies for the provided Card or Array of Cards.
  # @param dup_cards [Card, Array<Cards>] Optional; defaults to #cards.
  # @return [Array<Cards>] Optional; defaults to 1.
  def copy(dup_cards = self.cards, number_of_times = 1)
    dup_cards = [dup_cards] unless dup_cards.is_a? Array

    copies = []

    number_of_times.times do
      dup_cards.each do |original_card|
        copies << Card.new(original_card.types, original_card.values)
      end
    end

    copies
  end

  # Generates a Deck instance using #cards.
  # @return [Deck]
  def generate_deck
    Deck.new(cards)
  end

  # Assigns a #to_s value for each Card in #cards.
  # @param procedure [Proc, Lambda]
  # @return [Void]
  def assign_card_string(procedure)
    each { |card| card.to_s = procedure.call(card) }
  end
end
