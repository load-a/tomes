# frozen_string_literal: true

# A module containing some methods and variables to aid development.
# 	You can constantly update it like the classes that use ArgsUpdate or you can call it as needed.
# 	If you opt for the latter you will need to provide args as the final argument in each method.
module DevTools
  extend ArgsUpdate

  module_function

  # Generates an array of hashes for each string in the given list and passes that into `args.outputs.labels`.
  # 	Renders strings from top to bottom.
  # 	Starts from the given location and grows downward.
  # @note This method does not recognize escape characters like "\n".
  # @param location [Array<Integer, Integer>] The top-left corner of the first line of text.
  # @param text_array [Array<Strings>]
  # @param args [Args]
  # @return [Void]
  def render_string_array(location, text_array, args = self.args)
    return if text_array.nil?

    args.outputs.labels <<
      text_array.map_with_index do |e, i|
        {
          x: location[0],
          y: location[1] - (i * 25),
          text: e
        }
      end
  end
  alias list render_string_array

  # Generates an array of primitive hashes from the given list and passes that into `args.outputs.primitives`.
  # @param object_list [Array<Objects>] These objects must respond to #primitives.
  # @param args [Args]
  # @return [Void]
  def render_objects(object_list, args = self.args)
    args.outputs.primitives << object_list.map(&:primitives)
  end

  # Passes the given array of primitive hashes into `args.outputs.primitives`.
  # @param primitive_hashes [Array<Hashes>]
  # @param args [Args]
  # @return [Void]
  def render_primitives(primitive_hashes, args = self.args)
    args.outputs.primitives << primitive_hashes
  end

  # Generates an array of rect hashes from the given list and passes that into `args.outputs.primitives`.
  # @param object_list [Array<Objects>] These objects must respond to #rect.
  # @param args [Args]
  # @return [Void]
  def render_object_borders(object_list, args = self.args)
    args.outputs.borders << object_list.map(&:rect)
  end
  alias render_hitboxes render_object_borders

  # A method for rendering a list of label primitives.
  # @param label_hashes [Array<Hashes>]
  # @param args [Args]
  # @return [Void]
  def render_label_primitives(label_hashes, args = self.args)
    return if text_hashes.nil?

    args.outputs.labels << label_hashes.each
  end
end
