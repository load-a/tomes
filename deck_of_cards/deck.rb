require 'app/tomes/deck_of_cards/cards.rb'

##
# A class for creating and manipulating an ordered set of Cards. 
# Each deck must be initialized with one or more *suits* to be combined with one or more *values*, forming a Card.
# The order these attributes are given will become the default order for the entire deck.
# Cards are unique objects, so multiple identical cards can exist in a Deck without issue.

class Deck

	def initialize(suits: ['card'], values: ['0..1'])

		@card_list = Array.new
		suits.each do |suit|
			values.each do |value|
				if value.class == Range
					value.each { |range_number|
						@card_list << Card.new(['suit', 'value'], [suit, range_number.to_s])
					}
				else
					@card_list << Card.new(['suit', 'value'], [suit, value.to_s])
				end
			end
		end

		@deck = @card_list

		@discard_pile = Array.new

		@deck_attributes = ['suit', 'value']
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

	def delete_cards!(&block)
		@card_list.reject! { |card| yield(card) }
	end

	##
	# Adds a new attribute to each Card in the deck.
	# The attribute's name is passed as an argument. 
	# The logic for the values each card receives is passed through a block. 
	# The return values for the block are directly assigned as the card's new attribute.

	def append_deck_attribute(type, &block)
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

	def first(quantity = 1)
		@deck.first(quantity)
	end

	def peek(index = 1)
		@deck[index]
	end

	def last(quantity = 1)
		@deck.last(quantity)
	end

	def sort
		@deck.sort_by! { |card| 
			[@suit_order.index(card.suit), @value_order.index(card.value)]
		}
	end

	def sort_hand(hand)
		hand.sort_by { |card| 
			[@suit_order.index(card.suit), @value_order.index(card.value)]
		}
	end

	def reset
		@deck = @card_list
	end

	##
	# A hypothetical, or "throw-away" draw: can be said to "take cards out and put them back in." 
	# This method returns an *Array of Card objects*.
	# Be advised: the deck replenishes itself by default, making this unreliable for predicting the next draw.

	def pick(amount = 1, replenish_if_empty: true)
		hand = []

		temp_deck = @deck
		temp_discard = @discard_pile

		amount.times do
			if temp_deck.empty? and replenish_if_empty
				temp_deck += temp_discard
				temp_deck.shuffle!
			end
			hand << temp_deck.pop
		end
		
		hand
	end

	##
	# Literal draw: can be said to "physically remove cards from the deck."
	# Note that this method returns an *Array of Card Objects*.

	def draw!(amount = 1, replenish_if_empty: true)
		hand = []

		amount.times do
			replenish if @deck.empty? and replenish_if_empty
			hand << @deck.pop
		end
		
		hand
	end

	def discard(*cards)
		if cards[0].class == Array
			cards = cards[0].each { |e|
				e
			}
			
		end
		cards.each { |card| @discard_pile << card }
	end

	##
	# This method sends the discard_pile to the deck and shuffles it.

	def replenish
		@deck += @discard_pile
		@discard_pile = []
		shuffle!
	end

	def shuffle
		@deck.shuffle
	end

	def shuffle!
		@deck.shuffle!
	end

	def top_insert(*cards)
		@deck = (cards + @deck).flatten
	end

	def bottom_insert!(*cards)
		@deck = (@deck + cards).flatten
	end

	def random_insert!(*cards)
		cards.each { |card| @deck.insert( rand(@deck.length), card ) }
	end

	##
	# This method deals a number of cards to each hand (or "player").
	# This is realized as an array of lists of cards.
	# This function will deal until the deck is empty, and pass nil values to players after it has run out of cards.
	# This is the default 'deal' method.

	def deal_until_empty(number_of_cards, number_of_hands)
		hands = Array.new(number_of_hands) {Array.new}

		while hands.last.length < number_of_cards
			hands.map { |hand|
					hand << draw!
				}
		end
		hands.map {|hand| hand.flatten}
	end
	alias deal deal_until_empty

	##
	# This method deals a certain number of cards to a certain number of players.
	# Unlike deal_until_empty, this method will stop dealing once the number of cards in the deck is lower than the number of hands.
	# If the deck starts at a value lower than the number of hands, an array of empty arrays is returned.

	def deal_until_low(number_of_cards, number_of_hands)
		hands = Array.new(number_of_hands) {Array.new}

		while hands.last.length < number_of_cards and @deck.length >= number_of_hands
			hands.map { |hand|
					hand << draw!
				}
		end

		hands.map {|hand| hand.flatten}
	end

end
