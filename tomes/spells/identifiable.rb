# This module imparts a class-level ID counter (as well as methods for manipulating said counter) and a class tag.

module Identifiable

	@@id_counter = 0
	@@tag = String.new

	def increment_id_counter
		@@id_counter += 1
	end

	def set_class_tag(tag)
		@@tag = tag
	end

	def id_counter
		@@id_counter
	end

	def tag
		@@tag
	end

end

# This module includes methods for giving an Identifiable class instance its own ID attribute and a full ID Tag.
module Identity

	private
	attr_writer :id

	def set_id
		self.id = this_class.id_counter
		this_class::increment_id_counter
	end

	public 
	attr_reader :id

	def id_tag
		'%s%02d' % [this_class.tag, self.id]
	end

end