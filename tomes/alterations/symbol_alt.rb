# frozen_string_literal: true

# An adjustment to the Symbol class.
class ::Symbol
  # Symbols will check for instances of themselves when compared to an Array. Otherwise, this method behaves normally.
  # @note This change is required for the Keyboard class to function properly.
  # @param target [Object]
  # @return [Void]
  def ===(target)
    case target
    when ::Array
      target.include?(self)
    else
      super
    end
  end
end
