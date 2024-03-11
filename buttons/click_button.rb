require 'app/tomes/buttons/generic_button.rb'

# Represents buttons that are meant to be clicked and then immediately released
class ClickButton < GenericButton
	# @note 'extend ClickButtonList' is implemented in 'app/buttons/click_button_list.rb'
	def initialize(location: [0,0], size: [150, 50], text: "CLICK BUTTON")
		super(location: location, size: size, text: text)
	end

	def click
		@state = true
		resolve_color
	end

	def release
		@state = false
		resolve_color
	end

end

# The following block *must be* called for ClickButtons to work.
# This block is implemented in the ButtonConnection module.
# ```
# if Mouse.button.kind_of? ClickButton and Mouse.button.true? and !Mouse.click?
# 	Mouse.button.release
# end