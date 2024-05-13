# frozen_string_literal: true

# Alterations to the Module class.
class Module
  # Supplies DragonRuby with the #module_function method to conform to
  #   the rubocop style guide.
  # @return [Void]
  def module_function
    extend self
  end
end
