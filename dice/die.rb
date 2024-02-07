class Die

	private

	attr_writer :sides

	def initialize(sides)
		self.sides = sides
	end


	public

	attr_reader :sides

	def roll
		rand(sides) + 1
	end
	alias to_s roll
	alias roll_again roll
	
end