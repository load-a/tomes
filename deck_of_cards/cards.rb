##
# Objects used by the Deck class. Each Card is a set of two or more attributes (types) and their values.
# The default attributes are "suit" and "value", though these can be changed after the deck has been created.
# Note that the order of attributes is important when referencing Cards by their values.

class Card
	attr_reader :card_attributes

	def initialize(attributes, values)

		@card_attributes = Hash.new(0)

		attributes.each_with_index { |type, position|
			@card_attributes[type.to_sym] = values[position]
		}
		
	end

	def to_a
		@card_attributes.to_a
	end

	alias attributes card_attributes
	alias to_h card_attributes

	def to_s
		output = ""
		@card_attributes.each_value { |value|
			output += "%s\t" % [value]
		}		
		output
	end

	def add_attribute(type, value)
		@card_attributes[type.to_sym] = value
	end

	def remove_attribute(type)
		@card_attributes.reject! {|card_type| card_type.to_s == type}
	end

	def suit
		@card_attributes[:suit]
	end

	##
	# Default Value
	def value
		@card_attributes[:value]
	end

	def type_values
		@card_attributes.each_value.to_a
	end
end