##
# This CLASS contains color hashes to be merged with other objects' rendering hashes.
# Colors can be removed, modified or added within this class directly.
# Below is an example of its usage:
#
# args.outputs.solids << {
# 	x: 100,
# 	y: 100,
# 	w: 50,
# 	y: 50,
# }.merge(Color.green)

class Color
	def self.all
		[
			self.pink,
			self.cyan,
			self.brown,
			self.dark_brown,
			self.red,
			self.dark_red,
			self.orange,
			self.dark_orange,
			self.yellow,
			self.dark_yellow,
			self.green,
			self.dark_green,
			self.blue,
			self.dark_blue,
			self.purple,
			self.indigo,
			self.black,
			self.grey,
			self.white,
			self.background,
		]
	end

	def self.background
		rgb = [	230, 230, 230]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :background
		}
	end

	def self.white
		rgb = [255, 255, 255]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :white
		}
	end

	def self.grey
		rgb = [178, 178, 178]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :grey
		}
	end

	def self.black
		rgb = [0, 0, 0]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :black
		}
	end

	def self.pink
		rgb = [255, 77, 128]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :pink
		}
	end 

	def self.cyan
		rgb = [22, 244, 208]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :cyan
		}
	end 

	def self.brown
		rgb = [206, 129, 71]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :brown
		}
	end

	def self.dark_brown
		rgb = [86, 29, 37]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :dark_brown
		}
	end

	def self.red
		rgb = [239, 39, 27]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :red
		}
	end

	def self.dark_red
		rgb = [113, 0, 0]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :dark_red
		}
	end

	def self.yellow
		rgb = [252, 186, 4]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :yellow
		}
	end

	def self.dark_yellow
		rgb = [100, 69, 54]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :dark_yellow
		}
	end

	def self.orange
		rgb = [230, 127, 13]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :orange
		}
	end

	def self.dark_orange
		rgb = [172, 57, 49]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :dark_orange
		}
	end

	def self.green
		rgb = [47, 191, 113]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :green
		}
	end

	def self.dark_green
		rgb = [36, 62, 54]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :dark_green
		}
	end

	def self.blue
		rgb = [60, 145, 230]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :blue
		}
	end

	def self.dark_blue
		rgb = [1, 22, 56]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :dark_blue
		}
	end

	def self.purple
		rgb = [138, 79, 255]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :purple
		}
	end

	def self.indigo
		rgb = [57, 20, 99]
		
		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :indigo
		}
	end

	def self.test_color(r, g, b)
		rgb = [r, g, b]

		{
			r: rgb[0],
			g: rgb[1],
			b: rgb[2],
			color_name: :new
		}
	end
end
