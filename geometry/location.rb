##
# A module that extracts Location information out of classes which would include it.

module Location

	private 

	attr_writer :x, :y

	public

	attr_reader :x, :y

	def position
		[x, y]
	end

	def set_position!(point)
		self.x, self.y = point
	end
	alias change_position! set_position!

end