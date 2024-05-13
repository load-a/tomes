# frozen_string_literal: true

# A module for giving a Class the ability to log and track instances of itself.
module Group
  @list = []

  # Adds an object to the list.
  # @param object [Object] An instance of the class.
  # This method should probably be called in #initialize.
  # @return [Void]
  def add(object)
    @list << object
  end

  # Removes an object from the list.
  # @param object [Object] An instance of the class.
  # @return [Void]
  def delete(object)
    @list.delete(object)
  end

  # An array of all the instances of a class being tracked.
  # @return [Array]
  def list
    @list
  end
  alias all list
end

# A module for giving objects a way to add or remove themselves to their class's `.list`.
module Individual
  private

  # Adds this object to the Class's `.list` array.
  # @return [Void]
  def add_to_group
    this_class.add(self)
  end

  public

  # Adds this object to the Class's `.list` array.
  # @return [Void]
  def delete_from_group
    this_class.delete(self)
  end
end
