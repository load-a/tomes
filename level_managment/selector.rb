class Selector

	@@id_number = 0

	def initialize
		@preview = []
		@possession = nil	# for objects and tangible things
		@memory = nil			# for Symbols and other intangibles
		@stack = [] 			# NOTE: Experimental; May be useful for having a permanent selection and a temporary one at the same time
		@id = @@id_number
		@@id_number += 1
	end

	def possession
		@possession
	end

	def take!(object)
		@possession = object
	end

	def drop!
		@possession = nil
	end

	def has? this
		@possession == this
	end

	def empty?
		@possession == nil
	end


	def memory
		@memory
	end

	def remember! this
		@memory = this
	end

	def forget!
		@memory = nil
	end

	def knows? this
		@memory == this
	end

	def blank?
		@memory == nil
	end


	def stack
		@stack
	end

	def copy_possession
		@stack.push @possession
	end

	def push_possession!
		@stack.push @possession
		drop!
	end

	def load_possession
		@possession = @stack.last
	end

	def pop_possession!
		@possession = @stack.pop
	end

	def copy_memory
		@stack.push @memory
	end

	def push_memory!
		@stack.push @memory
		forget!
	end

	def load_memory
		@memory = @stack.last
	end

	def pop_memory!
		@memory = @stack.pop
	end

	def empty!
		@stack = Array.new
	end


	def reset!
		drop!
		forget!
		empty!
	end

	def info 
		{
			self: self ,
			id: @id,
			has: @possession,
			remembers: @memory,
			stack: @stack
		}
	end

	def formatted_info
		"sel%02<id>b - h: %<has>s | r: %<remembers>s | s: %<stack>s" % info
	end

end