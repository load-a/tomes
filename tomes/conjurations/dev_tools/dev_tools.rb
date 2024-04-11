# Should not need a require statement.

# A class containing some methods and variables to aid development.
# 	You can constantly update it like the other ArgsUpdate classes or you can call it as needed. 
# 	If you opt for the latter you will need to provide args as the final argument in each method.
class DevTools
	extend ArgsUpdate

	class << self
		attr_accessor :mode

		def render_string_array(location, text_array, args = self.args)
			return if text_array == nil
			args.outputs.labels << text_array.map_with_index { |e, i|
				{
					x: location[0],
					y: location[1] - (i * 25),
					text_array: e
				}
			}
		end

		def render_objects(object_list, args = self.args)
			args.outputs.primitives << object_list.map { |object| object.primitives }
		end

		def render_primitives(primitive_hashes, args = self.args)
			args.outputs.primitives << primitive_hashes
		end

		def render_object_borders(object_list, args = self.args)
			args.outputs.borders << object_list.map { |object| object.rect }
		end
		alias render_hitboxes render_object_borders

		def render_label_primitives(label_hashes, args = self.args)
			return if text_hashes == nil
			args.outputs.labels << label_hashes.each
		end
	end

end