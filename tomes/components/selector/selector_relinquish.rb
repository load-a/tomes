# frozen_string_literal: true

# All methods related to deleting data from the Selector's attributes.
module SelectorRelinquish
  # @return [Void]
  def drop
    self.possession = nil
  end

  # @return [Void]
  def forget
    self.memory = nil
  end

  # @return [Void]
  def reset!
    drop
    forget
  end
end
