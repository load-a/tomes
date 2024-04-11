module Size

	private
	attr_writer :width, :height

	public 
	attr_reader :width, :height

	alias w width
	alias h height

	def set_width(new_width)
		self.width = new_width
	end
	alias change_width set_width

	def set_height(new_height)
		self.height = new_height
	end
	alias change_height set_height

	# @return [Void]
	def set_size(new_size)
		self.width, self.height = new_size
	end
	alias change_size set_size

	def adjust_width(width_offset)
		self.width += width_offset
	end
	alias widen adjust_width

	def adjust_height(height_offset)
		self.height += height_offset
	end
	alias lengthen adjust_height

	def adjust_size(size_offset)
		self.width += size_offset[0]
		self.height += size_offset[1]
	end
	alias grow adjust_size

	def get_size
		[width, height]
	end
	alias size get_size
	alias proportions get_size

end