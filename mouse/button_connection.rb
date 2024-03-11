require 'app/tomes/buttons/button.rb'

module ButtonConnection

	def current_button
		return unless on_any_in? Button.all
		Mouse.sees_in_list(Button.all)[0]
	end
	alias button current_button

	def on_button?
		!current_button.nil?
	end

	def interact_with_button
		return if current_button.nil?

		if Mouse.click?
			current_button.hold if current_button.kind_of? HoldButton
			current_button.click if current_button.kind_of? ClickButton
			current_button.toggle if current_button.kind_of? ToggleButton		
		elsif Mouse.hold?
			current_button.hold if current_button.kind_of? HoldButton
		elsif Mouse.up?
			current_button.release unless current_button.kind_of? ToggleButton
		end
	end

	def highlight_button
		return if current_button.nil?
		Mouse.current_button.highlight
	end

	def release_click_buttons
		# This is required for click buttons to function properly.
		if Mouse.button.kind_of? ClickButton and Mouse.button.true? and !Mouse.click? 
			Mouse.button.release
		end
	end

end