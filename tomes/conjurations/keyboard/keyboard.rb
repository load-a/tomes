# Should not need to require ArgsUpdate

require 'app/tomes/conjurations/keyboard/input_lists.rb'
require 'app/tomes/conjurations/keyboard/full_keyboard.rb'

# A class for handling Keyboard input.
class Keyboard
	extend ArgsUpdate
	extend InputLists
	extend FullKeyboard

	class << self

		def inputs
			args.inputs.keyboard.keys
		end
		
	end

end