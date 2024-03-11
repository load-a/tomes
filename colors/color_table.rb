require 'app/tomes/colors/color.rb'
require 'app/tomes/geometry/location.rb'

class ColorTable
	extend Location
	
	class << self
		def x
			1000
		end

		def y
			20
		end

		def bar_height
			300/9
		end

		def bar_width
			128
		end


		def light
			[
				{
					x: x,
					y: (bar_height*8) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.cyan),
				{
					x: x,
					y: (bar_height*7) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.red),
				{
					x: x,
					y: (bar_height*6) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.orange),
				{
					x: x,
					y: (bar_height*5) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.brown),
				{
					x: x,
					y: (bar_height*4) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.yellow),
				{
					x: x,
					y: (bar_height*3) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.green),
				{
					x: x,
					y: (bar_height*2) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.blue),
				{
					x: x,
					y: bar_height + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.purple),
			]
		end

		def dark
			[
				{
					x: x + bar_width,
					y: (bar_height*8) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.pink),
				{
					x: x + bar_width,
					y: (bar_height*7) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.dark_red),
				{
					x: x + bar_width,
					y: (bar_height*6) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.dark_orange),
				{
					x: x + bar_width,
					y: (bar_height*5) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.dark_brown),
				{
					x: x + bar_width,
					y: (bar_height*4) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.dark_yellow),
				{
					x: x + bar_width,
					y: (bar_height*3) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.dark_green),
				{
					x: x + bar_width,
					y: (bar_height*2) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.dark_blue),
				{
					x: x + bar_width,
					y: (bar_height*1) + y,
					w: bar_width,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.indigo),
			]
		end

		def monochrome
			[
				{
					x: x,
					y: y,
					w: bar_width/2,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.white),
				{
					x: x + bar_width/2,
					y: y,
					w: bar_width/2,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.grey),
				{
					x: x + bar_width,
					y: y,
					w: bar_width/2,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.black),
				{
					x: x + bar_width*1.5,
					y: y,
					w: bar_width/2,
					h: bar_height,
					primitive_marker: :solid,
				}.merge(Color.background)
			]
		end

		def border
			{
				x: x,
				y: y,
				w: bar_width*2,
				h: bar_height*9,
				primitive_marker: :border
			}
		end

		def all
			[light + dark + monochrome, border].flatten
		end

	end

end