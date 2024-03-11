require 'app/tomes/buttons/click_button.rb'
require 'app/tomes/geometry/geometry.rb'
require 'app/tomes/windows/window_text.rb'
require 'app/tomes/windows/window_buttons.rb'

class Window
	include Geometry
	include WindowText
	include WindowButtons

	@@all = []
	class << self
		
		def all
			@@all
		end

	end

	private
	attr_accessor :buttons 

	def initialize(title = 'title', body = 'text', number_of_buttons = 1)
		self.title = title
		self.body = body

		button_section_height = 115

		set_location! [300, 100]

		puts buttons

		if number_of_buttons > 0
			set_size! [title_length_plus_padding, title_height+body_height+button_section_height] 
		else
			set_size! [title_length_plus_padding, title_height+body_height+BOTTOM_PADDING] 
		end

		initialize_buttons(number_of_buttons)


		@@all << self

	end

	public
	attr_accessor :title, :body

	def move(new_location)
		dif_x = new_location[0] - x
		dif_y = new_location[1] - y

		set_location!(new_location)

		buttons.each_value { |button| 
			button.set_location! [button.x + dif_x, button.y + dif_y]
		}
	end

	def primitives
		[rect.merge(Color.black),	divider, button_primitives, texts, background_hash].reverse
	end

	def divider
		{
			x: x,
			y: apex[1]-TITLE_LINE_HEIGHT-TOP_PADDING-BOTTOM_PADDING,
			x2: apex[0]-1,
			y2: apex[1]-TITLE_LINE_HEIGHT-TOP_PADDING-BOTTOM_PADDING,
			primitive_marker: :line
		}
	end

	def background_hash
		background = rect
		background[:primitive_marker] = :solid
		background.merge(Color.white)
	end

end