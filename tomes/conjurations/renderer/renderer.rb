class Renderer
	extend ArgsUpdate

	@@render_list = []

	# Not implemented yet.
	# 	Give object these attributes to establish render priority.
	# 	@@layer_order = [:background, :midground, :foreground]
	# 	@@element_order = [:background_element, :foreground_element, :border]
	
	class << self

		def render_list
			@@render_list
		end

		def add(object)
			return if render_list.include? object
			render_list << object
		end

		def delete(object)
			render_list.delete(object)
		end
		alias remove delete


		def render
			args.outputs.primitives << parse_classes
		end

		def parse_classes(list = flatten_render_list)

			list.map { |object|

				if object.respond_to? 'primitives'
					object.primitives

				elsif object.respond_to? 'rect'
					object.rect

				elsif object.respond_to? 'visible'
					parse_classes(object.visible)

				elsif object.kind_of? Hash
					object

				else
					puts "Render Object not accounted for: " + object
				end

			}

		end

		def flatten_render_list
			render_list.flatten
		end

	end
end