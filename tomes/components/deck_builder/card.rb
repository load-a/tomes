# frozen_string_literal: true

# A data structure consisting of a set of traits.
#   A "trait" is a key value-pair consisting of a *type*
#   (i.e. "suit") and a *value* (i.e. "spades").
class Card
  private

  # @!attribute traits [w]
  # 	A Hash of all the card's traits.
  # @!attribute archive [w] attribute
  # 	A variable that can be used to hold an instance of #traits.
  # 	@note Experimental. Not implemented.
  attr_writer :traits, :archive

  def initialize(types = %i[suit rank], values = [nil, 0])
    self.traits = Hash.new(0)

    types.length.times do |index|
      traits[types[index]] = values[index]
    end

    self.archive = traits

    self.to_s = self
  end

  public

  # @!attribute traits [r]
  # 	A Hash of all the card's traits.
  # @!attribute archive [r]
  # 	A variable that can be used to hold an instance of #traits.
  # 	@note Experimental. Not implemented.
  attr_reader :traits, :archive
  attr_accessor :to_s

  # Creates a trait and adds it to `#traits`.
  # @note *Do not* distribute traits to Cards unevenly.
  # 	This may cause other classes that handle them to function improperly.
  # 	If certain Cards have a trait that others don't,
  # 		give those other Cards the same type with a default value.
  # 	See the Hanafuda demo for an example.
  # @param type [Symbol]
  # @param value [String, Numeric]
  def add_trait(type, value)
    traits[type] = value
  end
  alias change_trait add_trait
  alias change add_trait
  alias []= add_trait

  # Deletes a trait from `#traits`.
  # @param type [Symbol] The type of trait to be deleted.
  # @return [String, Numeric] The value of the recently deleted trait.
  def remove_trait(type)
    traits.delete(type)
  end

  # Allows Card values to be accessed like a Hash.
  # @param type [Symbol]
  def [](type)
    traits[type]
  end

  # Checks for the given type.
  # @return [Boolean]
  def type?(type)
    traits.include? type
  end
  alias has? type?

  # Checks for an instance of the given values. Returns true if *at least one of them* are found.
  # @return [Boolean]
  def value?(*values)
    values.map do |value|
      traits.value? value
    end.any?
  end
  alias is? value?

  # Checks the given trait is a proper subset of `#traits`.
  # @note It is possible to check for multiple traits at a time,
  #   but this method will return true only if *all of them* exist in `#traits`.
  # @param trait [Hash]
  # @return [Boolean]
  def trait?(trait)
    traits >= trait
  end
  alias include? trait?

  # ADD TO TOMES
  def types
    traits.keys
  end

  # ADD TO TOMES
  def values
    traits.values
  end
end
