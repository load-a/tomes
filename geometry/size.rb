# The object's height and width.
module Size

	private
	attr_writer :width, :height

	public 
	attr_reader :width, :height

	alias w width
	alias h height

	# The width and height combined.
	# @return [Array<Integer>]
	def size
		[width, height]
	end
	alias proportions size

	# @note Only meant to be used with object initialization.
	# @return [Void]
	def set_size!(size)
		self.width, self.height = size
	end

end
