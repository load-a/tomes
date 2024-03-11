require 'app/tomes/buttons/generic_button.rb'

class HoldButton < GenericButton
	def initialize(location: [0,0], size: [150, 50], text: "HOLD BUTTON")
		super(location: location, size: size, text: text)
	end

	def hold
		@state = true
		resolve_color
	end

	def release
		@state = false
		resolve_color
	end
	
end