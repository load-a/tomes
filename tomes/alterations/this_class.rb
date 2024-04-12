# This gives Object a new method, #this_class. T

class Object
	private

	# @note This method is really just aesthetic, but the rest of the tools are written assuming its implementation.
	# @return [Class]
	def this_class
		self.class
	end
	
end