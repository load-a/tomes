# This set of modules imparts a list of all instances as a class method, and includes instance methods for adding and removing an object's self from said list.

module Group

	@@all = []

	def add(object)
		@@all << object
	end

	def delete(object)
		@@all.delete(object)
	end

	public

	def all
		@@all
	end

end

module Individual

	private

	def add_to_group
		this_class::add(self)
	end

	public

	def delete_from_group
		this_class::delete(self)
	end

end

