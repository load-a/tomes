# frozen_string_literal: true

require 'app/tomes/components/deck_builder/hand_iteration'
require 'app/tomes/components/deck_builder/hand_information'

# A collection of Cards.
class Hand
  include HandIteration
  include HandInformation

  private

  attr_writer :cards

  def initialize(initial_cards = [])
    self.cards = (initial_cards.is_a?(Array) ? initial_cards : [initial_cards])
    self.sorting_pattern = nil
  end

  # A component method for #sort!.
  def card_sort(card)
    sorting_pattern.map do |trait, sort_array|
      if sort_array.nil?
        card[trait]
      else
        sort_array.index(card[trait])
      end
    end
  end

  public

  attr_reader :cards
  
  # @!attr sorting_pattern [rw]
  #   Sets how the deck will be sorted. The pattern must be a Hash.
  #   Its keys are the types--in order--to be checked and its values are arrays specifying the order.
  #     Set the value to `nil` if you want to use the Card's own values for sorting.
  #     (i.e. Sorting by point value, sorting by name alphabetically, etc.)
  attr_accessor :sorting_pattern

  # The Four R's
  # Receive

  # Adds the provided card into #cards.
  def receive(new_cards)
    self.cards += new_cards
  end
  alias take receive
  alias draw receive

  # Reference
  # Returns Cards based on their index in #cards. Multiple indices can be used in a single call.
  def [](*indices)
    see_cards = []

    indices.each do |index|
      card = cards[index]
      next if see_cards.include? card

      see_cards << card
    end

    see_cards.flatten
  end

  # Reorder (Sort, Shift, Shuffle)
  # Sorts #cards based on the `sorting_pattern`. Will raise an exception if a pattern has not been assigned.
  def sort!
    raise StandardError, 'You must first assign a sorting pattern before calling #sort!.' if sorting_pattern.nil?

    cards.sort_by do |card|
      card_sort(card)
    end
  end

  # Moves the designated card to the provided index.
  # @param this_card [Integer, Card] Either the Card or its index.
  # @return [Void]
  def move(this_card, destination_index)
    source_index = this_card.is_a?(Integer) ? this_card : card.index(this_card)

    cards.insert(destination_index, cards.delete_at(source_index))
  end
  alias mov move # For all the assembly programmers out there.

  def shuffle!
    cards.shuffle!
  end

  # Remove

  # Removes cards from #cards.
  # @param these_cards [Cards]
  # @return [Array]
  def discard(*these_cards)
    removed_cards = []

    each do |card|
      (removed_cards << card) if these_cards.include? card
    end

    self.cards -= removed_cards
    removed_cards
  end
  alias give discard

  # Removes cards from #cards.
  # @return [Array]
  def discard_index(*indices)
    removed_cards =
      indices.map do |index|
        cards[index]
      end

    self.cards -= removed_cards
    removed_cards
  end

  def pop(number_of_cards = 1)
    cards.pop(number_of_cards)
  end

  # Other

  # Lists all types present in #cards.
  # @return [Array]
  def all_types
    list = []

    each do |card|
      list += card.types unless card.types == list
      list.uniq!
    end

    list
  end

  # Lists all values present in #cards.
  # @return [Array]
  def all_values
    list = []

    each do |card|
      list += card.values
    end

    list
  end
end
