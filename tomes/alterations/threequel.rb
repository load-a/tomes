# This allows Keyboard input arrays to be processed in a switch statement.
# @note This change is required for the Keyboard class to function properly.

class ::Symbol

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

  def ===(other)
    case other
    when ::Array
      other.include? self
    else
      super
    end
  end
  
end
