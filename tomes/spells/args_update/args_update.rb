# frozen_string_literal: true

# A module that gives an 'update' method to any class that needs to update its args.
module ArgsUpdate
  private

  # @!attribute [rw] args
  # 	I still have no idea what 'args' actually is but its a core part of the runtime.
  attr_accessor :args

  public

  # Refreshes args for the object.
  # @note This must be called every frame.
  # @param args [Args]
  # @return [Void]
  def update(args)
    self.args = args
  end
end
