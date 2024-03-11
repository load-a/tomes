require 'app/tomes/geometry/perimeter.rb'

# Methods for setting an object's location in reference to another object.

module Position

	def left_of(object, spacing: 10)
		object.x - self.width - spacing
	end

	def put_left_of!(this, spacing: 10)
		set_x!( left_of(this, spacing: spacing) )
	end

	def left_of?(this)
		self.x < this.x
	end


	def right_of(object, spacing: 10)
		object.x + object.width + spacing
	end

	def put_right_of!(this, spacing: 10)
		set_x!(right_of(this, spacing: spacing))
	end

	def right_of?(this)
		self.x > this.x
	end


	def above(object, spacing: 10)
		object.y + object.height + spacing
	end

	def put_above!(this, spacing: 10)
		set_y!(above(this, spacing: spacing))
	end

	def above?(this)
		self.y > this.y
	end


	def below(object, spacing: 10)
		object.y - self.height - spacing
	end

	def put_below!(this, spacing: 10)
		set_y!(below(this, spacing: spacing))
	end

	def below?(this)
		self.y < this.y
	end


	def align_vertically_to!(this)
		self.y = this.y
	end
	alias align_vertically_with! align_vertically_to!

	def align_horizontal_to!(this)
		self.x = this.x
	end
	alias align_horizontal_with! align_horizontal_to!

	def in_row_with?(this)
		self.y == this.y
	end

	def in_column_with?(this)
		self.x == this.x
	end

end