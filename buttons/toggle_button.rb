require 'app/tomes/buttons/generic_button.rb'

class ToggleButton < GenericButton
	def initialize(location: [0,0], size: [150, 50], text: "TOGGLE BUTTON")
		super(location: location, size: size, text: text)
	end

	def toggle
		@state = !@state
		resolve_color
	end

end