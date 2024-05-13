# frozen_string_literal: true

module Renderer
  extend ArgsUpdate

  module_function

  @render_list = []

  # Returns the class render list.
  # @return [Array]
  def render_list
    @render_list
  end

  # Individually adds given objects to the render list.
  # 	If an object is already in the list it gets skipped in this process.
  # @param objects [*Object] 1 or more objects.
  # @return [Void]
  def add(*objects)
    objects.each do |object|
      next if render_list.include? object

      render_list << object
    end
  end

  # Deletes given objects from the render list.
  # @param objects [Objects] 1 or more objects.
  # @return [Void]
  def delete(*objects)
    objects.each do |object|
      render_list.delete(object)
    end
  end
  alias remove delete

  # Sends the render list to
  # @return [Void]
  def render
    args.outputs.primitives << parse_classes
  end

  # Maps each object in a list onto its renderable state, based on class; returns said list.
  # @param list [Array] Uses #flatten_render_list by default.
  # @return [Array]
  def parse_classes(list = render_list.flatten)
    list.map do |object|
      if object.respond_to? 'primitives' 	# Most objects should fall into this category.
        object.primitives

      elsif object.respond_to? 'rect'
        object.rect

      elsif object.respond_to? 'visible' 	# This applies to Scenes.
        parse_classes(object.visible)	# This method will call itself on the Scene's #visible list.

      elsif object.is_a? Hash
        object

      else
        puts "Render Object not accounted for: #{object}"
      end
    end
  end
end

# @todo
# 	1. Give object these attributes to establish render priority.
# 		- @@layer_order = [:background, :midground, :foreground]
# 		- @@element_order = [:background_element, :foreground_element, :border]
