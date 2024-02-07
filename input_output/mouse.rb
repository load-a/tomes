# Dependencies: Level;
class Mouse < ArgsObject
	@x = 0
	@y = 0

	def self.update(args)
		super
		@x = @args.inputs.mouse.x
		@y = @args.inputs.mouse.y
	end

	##
	def self.position
		[@x.to_i, @y.to_i]
	end

	def self.x
		@x.to_i
	end

	def self.y
		@y.to_i
	end


	def self.click
		@args.inputs.mouse.click
	end

	##
	# This method looks through a list of rendered objects and sees if it intersects any of them.

	def self.on_any_in?(list)
		list.map { |object| self.on?(object) }.include? true
	end

	##
	# This method returns all objects in a list the Mouse is currently on.

	def self.sees_in(list)
		list.map { |object| object if self.on?(object) }.flatten.compact
	end

	##
	# This method is used to check if the mouse is on a certain object within a list.

	def self.on?(object)
		@args.inputs.mouse.intersect_rect? object.rect
	end


	##
	# A list of attributes for the Mouse. 
	# Presented here to make getting (and rendering) this information more convenient.

	def self.data
		{
			self: "Mouse",
			position: self.position,
		}
	end

	##
	# This method formats Mouse.data a little and puts it in an array.
	# This can be easily used with the QuickRender module.

	def self.info
		i_array = []
		data.each { |k, v|
			i_array << "#{k.capitalize}: #{v}"
		}
		i_array
	end
end