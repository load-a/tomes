module Errors

	class Error < StandardError; end

	class InvalidTypeError < Error
		def initialize(message = "GameObject has invalid type")
			super
		end
	end
	
end