## 
# Below are a set of demonstrations for making different kinds of decks of varying composition and complexity.
# At the vary end is a demonstration of how this class may be used in a CLI Mahjong game.

# WESTERN CARDS
bike = Deck.new(suits: %w[spades hearts clubs diamonds], values: ['ace', (2..10), 'jack', 'queen', 'king'])

bike.append_deck_attribute('color') { |card| if card.suit == 'diamonds' or card.suit == 'spades' then 'black' else 'red' end }

bike.add_cards(%w[joker small red], %w[joker big black])
# Optional Rules:
# bike.delete_cards! {|card| card.suit == 'joker'}
# bike.remove_deck_attribute('color')
# bike.append_deck_attribute('points') { |card| 
# 	if card.value.to_i > 0
# 		card.value
# 	elsif card.value == 'ace'
# 		[1, 11]
# 	else
# 		10
# 	end
# }


# HANAFUDA
hana = Deck.new(suits: %w[january february march april may june july august september october november december], values: ['chaff'] )
# NOTE: all of these could be condensed into a single #add_cards call.
hana.add_cards(%w[january chaff], %w[january light], %w[january poem])
hana.add_cards(%w[february chaff], %w[february seed], %w[february poem])
hana.add_cards(%w[march chaff], %w[march light], %w[march poem])
hana.add_cards(%w[april chaff], %w[april seed], %w[april poem])
hana.add_cards(%w[may chaff], %w[may seed], %w[may poem])
hana.add_cards(%w[june chaff], %w[june seed], %w[june poem])
hana.add_cards(%w[july chaff], %w[july seed], %w[july poem])
hana.add_cards(%w[august chaff], %w[august light], %w[august seed])
hana.add_cards(%w[september chaff], %w[september seed], %w[september poem])
hana.add_cards(%w[october chaff], %w[october seed], %w[october poem])
hana.add_cards(%w[november seed], %w[november light], %w[november poem])
hana.add_cards(%w[december chaff], %w[december light], %w[december chaff])

hana.append_deck_attribute('points') do |card|
	case card.value
	when 'light'
		20
	when 'seed'
		10
	when 'poem'
		5
	else
		1
	end
end

hana.change_value_order(%w[chaff poem seed light])


# MAHJONG (basic)
mah = Deck.new(suits: %w[sticks circles characters], values: [1..9])
mah.create_cards(%w[winds east], %w[winds south], %w[winds west], %w[winds north])
mah.create_cards(%w[dragons green], %w[dragons red], %w[dragons white])

circles = mah.deck.select {|tiles| tiles.suit == 'circles'}.map {|tile| tile.type_values}
sticks = mah.deck.select {|tiles| tiles.suit == 'sticks'}.map {|tile| tile.type_values}
chars = mah.deck.select {|tiles| tiles.suit == 'characters'}.map {|tile| tile.type_values}
winds = mah.deck.select {|tiles| tiles.suit == 'winds'}.map {|tile| tile.type_values}
dragons = mah.deck.select {|tiles| tiles.suit == 'dragons'}.map {|tile| tile.type_values}

3.times do 
	mah.create_cards(*circles, *sticks, *chars, *dragons, *winds)
end


mah.shuffle!
table = mah.deal(13, 4)
east_seat = mah.sort_hand(table[0])
drawn_tile = mah.draw!
puts "My hand: "
puts east_seat.map {|tile| " " + tile.to_s.capitalize}
puts "My Draw: "
puts " " + drawn_tile[0].to_s