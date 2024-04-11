# An class for handling mouse input.
# @note Mouse#update must be called every tick you wish to use this class.

class Mouse 
	extend ArgsUpdate
	extend Location

	class << self

		def update(args)
			super
			self.x = args.inputs.mouse.x.to_i
			self.y = args.inputs.mouse.y.to_i
		end


		def click?
			args.inputs.mouse.click ? true : false
		end

		def held?
			args.inputs.mouse.held ? true : false
		end
		alias hold? held?

		def up?
			args.inputs.mouse.up ? true : false
		end


		def on?(thing)
			args.inputs.mouse.intersect_rect? thing.rect
		# I cant figure out how to resolve nil errors without this. 
		# 	DragonRuby won't tell me what the specific error class is either.
		rescue
			false
		end

		def on_something_in?(list)
			list.map { |thing| on?(thing) }.include? true
		end

		def sees(list)
			sees_in_list(list).last
		end

		def sees_in_list(list)
			list.map { |thing| thing if on?(thing) }.flatten.compact
		end
		alias sees_in sees_in_list


		def binary_signals
			click = click? ? 1 : 0
			hold = hold? ? 1 : 0
			up = up? ? 1 : 0

			'%d%d%d' % [click, hold, up]
		end

		def to_s
			'Mouse: %04d-%03d-%s' % [self.x, y, binary_signals]
		end

		def to_h
			{
				self: "Mouse",
				location: location,
				click: click?,
				down: hold?,
				up: up?
			}
		end

		def to_i
			('%04d%04d%s' % [x, y, binary_signals]).to_i
		end

	end
end
