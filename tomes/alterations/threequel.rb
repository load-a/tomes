# This allows Keyboard input arrays to be processed in a switch statement.
# @note This change is required for the Keyboard class to function properly.

class ::Symbol

  # Symbols will check for instances of themselves when compared to an Array. Otherwise, this method behaves normally.
  # @param other [Object]
  # @return [Void]
  def ===(other)
    case other
    when ::Array
      other.include?(self)
    else 
      super
    end
  end

end

class ::Numeric

  # Numerics will check for instances of themselves when compared to an Array. Otherwise, this method behaves normally.
  # @param other [Object]
  # @return [Void]
  def ===(other)
    case other
    when ::Array
      other.include? self
    else
      super
    end
  end
  
end
