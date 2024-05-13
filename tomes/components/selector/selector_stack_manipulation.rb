# frozen_string_literal: true

module SelectorStackManipulation
  def copy_possession
    stack.push @possession
  end

  def push_possession!
    stack.push @possession
    drop
  end

  def pop_possession!
    self.possession = stack.pop
  end

  def load_possession
    self.possession = stack.last
  end

  def copy_memory
    stack.push @memory
  end

  def push_memory!
    stack.push @memory
    forget
  end

  def pop_memory!
    self.memory = stack.pop
  end

  def load_memory
    self.memory = stack.last
  end

  def empty
    self.stack = []
  end
end
