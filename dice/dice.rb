class Dice

	private

	def initialize(*dice_as_strings)
		self.dice_spread = dice_as_strings
	end

	def self.roll_single(dice_as_string)
		total = 0
		quantity, sides = dice_as_string.downcase.split('d')

		quantity.to_i.times do 
			total += rand(sides.to_i)+1
		end

		total
	end

	public

	def self.roll(*dice_as_strings)
		total = 0
		dice_as_strings.each { |dice|
			total += self.roll_single(dice)
		}
		
		total
	end
	alias to_i self::roll


end