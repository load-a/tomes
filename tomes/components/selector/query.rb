# All methods for checking the state of the Selector.
module Query
	
	# Checks if #possession has the given object.
	# @param this [Object] This can be anything.
	# @return [Boolean]
	def has? this
		possession == this
	end

	# Checks if #possession is nil.
	# @return [Boolean]
	def empty?
		possession == nil
	end

	# Checks if #memory contains the given data.
	# @param this [Object] This can be anything.
	# @return [Boolean]
	def knows? this
		memory == this
	end

	# Checks if #memory is nil.
	# @return [Boolean]
	def blank?
		memory == nil
	end

end
