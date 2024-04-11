module Relinquish

	def drop
		self.possession = nil
	end

	def forget
		self.memory = nil
	end

	def reset!
		drop
		forget
	end

end
