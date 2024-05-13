# frozen_string_literal: true

# This module imparts a class-level ID counter (as well as methods for manipulating said counter) and a class tag.

module Identifiable
  @id_counter = 0
  @tag = String.new

  # Adds 1 to the ID counter.
  # @return [Void]
  def increment_id_counter
    @id_counter += 1
  end

  # Assigns the class (and its descendants) a tag for the #id_tag method in Identity.
  # @param tag [String]
  # @return [Void]
  def tag=(tag)
    @tag = tag
  end

  # Returns the class ID counter.
  # @return [Integer]
  def id_counter
    @id_counter
  end

  # Returns the class tag.
  # @return [String]
  def tag
    @tag
  end
end

# This module includes methods for giving an Identifiable class instance its own ID attribute and a full ID Tag.
module Identity
  private

  # @!attribute [w] id
  # 	The instance ID number.
  attr_writer :id

  # Sets the instance ID number.
  # 	Meant to only be used in #initialize.
  # @return [Void]
  def set_id
    self.id = this_class.id_counter
    this_class.increment_id_counter
  end

  public

  # @!attribute [r] id
  # 	The instance ID number.
  attr_reader :id

  # A string with the class tag and instance ID number.
  # @return String
  def id_tag
    format('%s%02d', this_class.tag, id)
  end
end
