require 'app/tomes/colors/color.rb'

module ButtonText

	def initialize_text(text)
		@text = text
		@text_color = Color.black
	end

	def text_hash
		{
			x: horizontal_center,
			y: vertical_center,
			text: @text,
			primitive_marker: :label,
			alignment_enum: 1,
			vertical_alignment_enum: 1
		}.merge(@text_color)
	end

	def set_text!(text)
		@text = text
	end

	# #note This assumes font size is 10p wide
	def resize_to_fit_text(padding = 10)
		text_length = (@text.length*10 + padding*2)
		if (text_length <=> width) != 0
			self.width = text_length
		end
	end


end