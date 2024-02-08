class Dice

	attr_writer :dice_spread

	def initialize(*dice_as_strings) # i.e. '2d4', '1d8', etc...
		self.dice_spread = dice_as_strings
	end

	def self.roll_single(die_as_string)
		total = 0
		quantity, sides = die_as_string.downcase.split('d')

		quantity.to_i.times do 
			total += rand(sides.to_i)+1
		end

		total
	end

	def self.roll(*dice_as_strings)
		total = 0
		dice_as_strings.each { |dice|
			total += self.roll_single(dice)
		}
		
		total
	end

end