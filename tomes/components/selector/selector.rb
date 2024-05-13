# frozen_string_literal: true

require 'app/tomes/components/selector/selector_acquire'
require 'app/tomes/components/selector/selector_relinquish'
require 'app/tomes/components/selector/selector_query'

# A mechanism for tracking two pieces of information at a time.
# 	For example, while dragging an item on screen a selector can track
#   both what the item is and the cursor's relative position to it.
# @note Stack-based functionality is experimental so it has been omitted.
#   It can be added manually.
class Selector
  extend Identifiable
  include Identity

  include SelectorAcquire
  include SelectorRelinquish
  include SelectorQuery

  private

  # @!attribute [w] possession
  # 	The convention is to use this attribute to represent "tangible" objects.
  # @!attribute [w] memory
  # 	The convention is to use this attribute to represent "intangible" data.
  attr_writer :possession, :memory

  def initialize
    set_id

    self.possession = nil
    self.memory = nil
  end

  public

  # @!attribute [r] possession
  # 	The convention is to use this attribute to represent "tangible" objects.
  # 	@return [Object]
  # @!attribute [r] memory
  # 	The convention is to use this attribute to represent "intangible" data.
  # 	@return [Object]
  attr_reader :possession, :memory

  # A hash containing basic data about the selector.
  #   @note This method will change (probably drastically) in a future update.
  # @return [Hash]
  def info
    {
      self: self,
      id: id_tag,
      has: @possession,
      remembers: @memory
    }
  end

  # A one-line string of some basic data about the selector.
  # @return [String]
  def to_s
    '%<id>s - h: %<has>s | r: %<remembers>s | s: %<stack>s' % info
  end
end
