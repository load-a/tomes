# The ancestor class for all classes that use args

class ArgsObject
	@args

	# Refreshes args for the object. 
	# @note This must be called every frame.
	# @param args [Args]
	# @return [Void]
	def self.update args
		@args = args
	end
end