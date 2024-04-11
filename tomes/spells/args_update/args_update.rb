module ArgsUpdate

	private
	attr_accessor :args

	public 
	# Refreshes args for the object. 
	# @note This must be called every frame.
	# @param args [Args]
	# @return [Void]
	def update args
		self.args = args
	end
end