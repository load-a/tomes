module DeckManipulation
	
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

	##
	# This method sends the discard_pile to the deck and shuffles it.

	def discard(*cards)
		if cards[0].class == Array
			cards = cards[0].each { |e|
				e
			}

		end
		cards.each { |card| @discard_pile << card }
	end

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
		cards.each { |card| @deck.insert(rand(@deck.length), card) }
	end

	##
	# This method deals a number of cards to each hand (or "player").
	# This is realized as an array of lists of cards.
	# This function will deal until the deck is empty, and pass nil values to players after it has run out of cards.
	# This is the default 'deal' method.

	def deal_until_empty(number_of_cards, number_of_hands)
		hands = Array.new(number_of_hands) { Array.new }

		while hands.last.length < number_of_cards
			hands.map { |hand|
				hand << draw!
			}
		end
		hands.map { |hand| hand.flatten }
	end

	alias deal deal_until_empty

	##
	# This method deals a certain number of cards to a certain number of players.
	# Unlike deal_until_empty, this method will stop dealing once the number of cards in the deck is lower than the number of hands.
	# If the deck starts at a value lower than the number of hands, an array of empty arrays is returned.

	def deal_until_low(number_of_cards, number_of_hands)
		return if number_of_hands < 1 or number_of_cards < 1
		hands = Array.new(number_of_hands) { Array.new }

		while number_of_cards > hands.last.length and @deck.length >= number_of_hands
			hands.map { |hand|
				hand << draw!
			}
		end

		hands.map { |hand| hand.flatten }
	end
end
