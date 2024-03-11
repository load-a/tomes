require 'app/tomes/colors/color.rb'

module ButtonBackground

	def initialize_background
		@border_color = Color.black

		@primary_background_color = Color.white
		@primary_background_transparancy = {a: 256}

		@secondary_background_color = Color.grey		
		@secondary_background_transparancy = {a: 128}

		@highlight_background_color = Color.blue
		@highlight_background_transparancy = {a: 32}

		@background_color = @primary_background_color
		@background_transparancy = @primary_background_transparancy
	end

	def use_primary_background_color
		@background_color = @primary_background_color
	end

	def use_secondary_background_color
		@background_color = @secondary_background_color
	end

	def use_highlight_background_color
		@background_color = @highlight_background_color
	end


	def use_primary_background_transparancy
		@background_transparancy = @primary_background_transparancy
	end

	def use_secondary_background_transparancy
		@background_transparancy = @secondary_background_transparancy
	end

	def use_highlight_background_transparancy
		@background_transparancy = @highlight_background_transparancy
	end

	def background_hash
		background = rect
		background[:primitive_marker] = :solid
		background.merge(@background_color).merge(@background_transparancy)
	end

	def highlight
		use_highlight_background_color
		use_highlight_background_transparancy
	end

	def resolve_color
		if state
			use_secondary_background_color
			use_secondary_background_transparancy

		else
			use_primary_background_color
			use_primary_background_transparancy

		end
	end
	alias unhighlight resolve_color

end