require 'app/tomes/deck_of_cards/deck_manipulation.rb'
require 'app/tomes/deck_of_cards/cards.rb'

##
# A class for creating and manipulating an ordered set of Cards. 
# Each deck must be initialized with one or more *suits* to be combined with one or more *values*, forming a Card.
# The order these attributes are given will become the default order for the entire deck.
# Cards are unique objects, so multiple identical cards can exist in a Deck without issue.

class Deck

	include DeckManipulation

	def initialize(suits: ['card'], values: ['0..1'])

		@card_list = Array.new
		suits.each do |suit|
			values.each do |value|
				if value.class == Range
					value.each { |range_number|
						@card_list << Card.new(%w[suit value], [suit, range_number.to_s])
					}
				else
					@card_list << Card.new(%w[suit value], [suit, value.to_s])
				end
			end
		end

		@deck = @card_list

		@discard_pile = Array.new

		@deck_attributes = %w[suit value]
		@suit_order = suits
		@value_order = values.map { |e|
				if e.class == Range
					e.to_a
				else 
					e
				end
			}.flatten.map {|e| e.to_s}
	end

	attr_reader :discard_pile, :deck
	
	# The following methods apply to the card_list.

	def card_list
		@card_list.sort_by! { |card| 
			[@suit_order.index(card.suit), @value_order.index(card.value)]
		}
	end
	alias list card_list

	##
	# Creates new cards and adds them to the card_list.
	# If a Deck is already in play, the Deck must be reset or these new cards must be added to it manually.
	
	def create_cards(*card_as_value_list)
		card_as_value_list.each { |card_values|
			@suit_order << card_values[0].to_s unless @suit_order.include? card_values[1].to_s
			@value_order << card_values[1].to_s unless @value_order.include? card_values[1].to_s
			@card_list << Card.new(@deck_attributes, card_values)
		}
	end
	alias add_cards create_cards

	##
	# Permanently removes Cards from the card_list.

	def delete_cards!
		@card_list.reject! { |card| yield(card) }
	end

	##
	# Adds a new attribute to each Card in the deck.
	# The attribute's name is passed as an argument. 
	# The logic for the values each card receives is passed through a block. 
	# The return values for the block are directly assigned as the card's new attribute.

	def append_deck_attribute(type)
		@deck_attributes << type
		@card_list.each { |card| card.add_attribute( type, yield(card)) }
	end

	## 
	# Removes an attribute from every card in the deck. 
	# This attribute's name can be passed as a string.

	def remove_deck_attribute(attribute)
		@card_list.each	{ |card| card.remove_attribute(attribute) }
	end

	def change_suit_order(new_order)
		@suit_order = new_order
	end

	def change_value_order(new_order)
		@value_order = new_order
	end

	# The following methods apply to the actual deck.

	def to_a
		@deck.map {|card| card.to_s}
	end

	def length
		@deck.length
	end

end
