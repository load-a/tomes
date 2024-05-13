# frozen_string_literal: true

# Alterations to the Object class
class Object
  private

  # @note This method is really just aesthetic, but the rest of the tools are written assuming its implementation.
  # @return [Class]
  def this_class
    self.class
  end

  alias is_an? is_a?
end
