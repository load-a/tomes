# This gives Object a new method, #this_class. This method is really just aesthetic, but the rest of the tools are written assuming its implementation.

class Object
	private
	def this_class
		self.class
	end
end