# frozen_string_literal: true

# All the methods related to setting a Selector's data.
module SelectorAcquire
  # Assign an object to #possession.
  # @param this [Object] This could be anything.
  # @return [Void]
  def take(this)
    self.possession = this
  end

  # Assign data to #memory.
  # @param this [Object] This could be anything.
  # @return [Void]
  def remember(this)
    self.memory = this
  end
end
