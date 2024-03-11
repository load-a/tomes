# Represents the abstract concept of a Button

class Button

	@@id = 0
	@@all = []

	class << self

		def all
			@@all
		end

		def all_primitives
			all.map { |button| button.primitives }
		end

		def formatted_info
			'Btn (%d)' % [all.length]
		end
		alias info formatted_info

	end

	private
	attr_writer :state, :id

	def initialize
		self.state = false
		self.id = @@id

		@@id += 1 
		@@all << self
	end

	public
	attr_reader :id
	attr_accessor :state

	def true?
		state == true
	end

	def false?
		state == false
	end

end