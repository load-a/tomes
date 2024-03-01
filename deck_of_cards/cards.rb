##
# Objects used by the Deck class. Each Card is a set of two or more attributes (types) and their values.
# The default attributes are "suit" and "value", though these can be changed after the deck has been created.
# Note that the order of attributes is important when referencing Cards by their values.

class Card
	# @return [Hash] The hash table for each attribute name and value.
	attr_reader :card_attributes

	def initialize(attributes, values)

		@card_attributes = Hash.new(0)

		attributes.each_with_index { |type, position|
			@card_attributes[type.to_sym] = values[position]
		}
		
	end

	# @return [Array] An array version of #card_attributes
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

	# @param [<String, Symbol>, object]

	def add_attribute(type, value)
		@card_attributes[type.to_sym] = value
	end

	# @param [String, Symbol] The attribute name you want to remove.
	# @return [void] Removes it from the #card_attributes hash. 
	# @note It is possible to erase the two default attributes this way, but #suit and #value will return nil.
	def remove_attribute(type)
		@card_attributes.reject! {|card_type| card_type.to_s == type}
	end

	# @return [String] The 'suit' attribute value as a String.
	def suit
		@card_attributes[:suit]
	end

	##
	# @return [String] The 'value' attribute value as a String.
	# @note This is the value parameter assigned at initialization.
	def value
		@card_attributes[:value]
	end

	# @return [Array<Arrays>] Converts each key-value pair into an array of strings, then returns those withing an array.
	def type_values
		@card_attributes.each_value.to_a
	end
end