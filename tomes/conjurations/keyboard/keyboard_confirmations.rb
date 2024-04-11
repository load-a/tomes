module KeyboardConfirmations

	def confirm_button
		confirm_buttons.map { |key, value|
			key unless (value.intersection down_inputs).empty?
		}.compact
	end
	alias confirm confirm_button

	def confirm_button_held
		confirm_buttons.map { |key, value|
			key unless (value.intersection held_inputs).empty?
		}.compact
	end
	alias confirm_button_hold confirm_button_held
	alias confirm_hold confirm_button_held
	alias confirm_held confirm_button_held

	def confirm_button_up
		confirm_buttons.map { |key, value|
			key unless (value.intersection up_inputs).empty?
		}.compact
	end
	alias confirm_up confirm_button_up

	def confirm_button?
		!confirm_button_held.empty?
	end
	alias confirm? confirm_button?

end
