module Query
	
	def has? this
		possession == this
	end

	def empty?
		possession == nil
	end

	def knows? this
		memory == this
	end

	def blank?
		memory == nil
	end

end
