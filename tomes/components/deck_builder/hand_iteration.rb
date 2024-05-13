# frozen_string_literal: true

# Provides some methods for iterating over a hand.
module HandIteration
  # Iterates through #cards and calls the block on each Card.
  # @return [Void]
  def each
    index = 0
    iteration_limit = cards.length

    until index >= iteration_limit
      yield cards[index], index
      index += 1
    end
  end
  alias each_with_index each

  # Calls #map on #cards.
  # @return [Array]
  def map(&block)
    cards.map(&block)
  end

  # Returns an array of cards for which the block returns a truthy value.
  # @return [Array<Cards>]
  def select
    selection = []

    each do |card|
      selection << card if yield card
    end

    selection
  end

  # Calls `#index` on #cards.
  # @return [Array<Integers>]
  def index(search_card, &block)
    cards.index(search_card, &block)
  end
end
