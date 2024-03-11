require 'app/tomes/input/args_object.rb'

# An alternate way of handling Keyboard input.

class Keyboard < ArgsObject
	
	# Returns a symbol for the letter being held, or :none.
	# @return [Symbol]
	def self.letter_hold
		return :a if @args.inputs.keyboard.key_held.a
		return :b if @args.inputs.keyboard.key_held.b
		return :c if @args.inputs.keyboard.key_held.c
		return :d if @args.inputs.keyboard.key_held.d
		return :e if @args.inputs.keyboard.key_held.e
		return :f if @args.inputs.keyboard.key_held.f
		return :g if @args.inputs.keyboard.key_held.g
		return :h if @args.inputs.keyboard.key_held.h
		return :i if @args.inputs.keyboard.key_held.i
		return :j if @args.inputs.keyboard.key_held.j
		return :k if @args.inputs.keyboard.key_held.k
		return :l if @args.inputs.keyboard.key_held.l
		return :m if @args.inputs.keyboard.key_held.m
		return :n if @args.inputs.keyboard.key_held.n
		return :o if @args.inputs.keyboard.key_held.o
		return :p if @args.inputs.keyboard.key_held.p
		return :q if @args.inputs.keyboard.key_held.q
		return :r if @args.inputs.keyboard.key_held.r
		return :s if @args.inputs.keyboard.key_held.s
		return :t if @args.inputs.keyboard.key_held.t
		return :u if @args.inputs.keyboard.key_held.u
		return :v if @args.inputs.keyboard.key_held.v
		return :w if @args.inputs.keyboard.key_held.w
		return :x if @args.inputs.keyboard.key_held.x
		return :y if @args.inputs.keyboard.key_held.y
		return :z if @args.inputs.keyboard.key_held.z

		return :comma if @args.inputs.keyboard.key_held.comma
		return :period if @args.inputs.keyboard.key_held.period
		return :question_mark if @args.inputs.keyboard.key_held.question_mark
		return :exclamation_point if @args.inputs.keyboard.key_held.exclamation_point
		return :semicolon if @args.inputs.keyboard.key_held.semicolon

		return :enter if @args.inputs.keyboard.key_held.enter
		return :space if @args.inputs.keyboard.key_held.space		
		return :shift if @args.inputs.keyboard.key_held.shift
		return :delete if @args.inputs.keyboard.key_held.backspace

		:none
	end

	# Returns a symbol for the letter being pressed, or :none.
	# @return [Symbol]
	def self.letter
		return :a if @args.inputs.keyboard.key_down.a
		return :b if @args.inputs.keyboard.key_down.b
		return :c if @args.inputs.keyboard.key_down.c
		return :d if @args.inputs.keyboard.key_down.d
		return :e if @args.inputs.keyboard.key_down.e
		return :f if @args.inputs.keyboard.key_down.f
		return :g if @args.inputs.keyboard.key_down.g
		return :h if @args.inputs.keyboard.key_down.h
		return :i if @args.inputs.keyboard.key_down.i
		return :j if @args.inputs.keyboard.key_down.j
		return :k if @args.inputs.keyboard.key_down.k
		return :l if @args.inputs.keyboard.key_down.l
		return :m if @args.inputs.keyboard.key_down.m
		return :n if @args.inputs.keyboard.key_down.n
		return :o if @args.inputs.keyboard.key_down.o
		return :p if @args.inputs.keyboard.key_down.p
		return :q if @args.inputs.keyboard.key_down.q
		return :r if @args.inputs.keyboard.key_down.r
		return :s if @args.inputs.keyboard.key_down.s
		return :t if @args.inputs.keyboard.key_down.t
		return :u if @args.inputs.keyboard.key_down.u
		return :v if @args.inputs.keyboard.key_down.v
		return :w if @args.inputs.keyboard.key_down.w
		return :x if @args.inputs.keyboard.key_down.x
		return :y if @args.inputs.keyboard.key_down.y
		return :z if @args.inputs.keyboard.key_down.z

		return :comma if @args.inputs.keyboard.key_down.comma
		return :period if @args.inputs.keyboard.key_down.period
		return :question_mark if @args.inputs.keyboard.key_down.question_mark
		return :exclamation_point if @args.inputs.keyboard.key_down.exclamation_point
		return :semicolon if @args.inputs.keyboard.key_down.semicolon

		return :enter if @args.inputs.keyboard.key_down.enter
		return :space if @args.inputs.keyboard.key_down.space		
		return :shift if @args.inputs.keyboard.key_down.shift
		return :delete if @args.inputs.keyboard.key_down.backspace

		:none
	end

	# Returns a symbol for the letter being released, or :none.
	# @return [Symbol]
	def self.letter_up
		return :a if @args.inputs.keyboard.key_up.a
		return :b if @args.inputs.keyboard.key_up.b
		return :c if @args.inputs.keyboard.key_up.c
		return :d if @args.inputs.keyboard.key_up.d
		return :e if @args.inputs.keyboard.key_up.e
		return :f if @args.inputs.keyboard.key_up.f
		return :g if @args.inputs.keyboard.key_up.g
		return :h if @args.inputs.keyboard.key_up.h
		return :i if @args.inputs.keyboard.key_up.i
		return :j if @args.inputs.keyboard.key_up.j
		return :k if @args.inputs.keyboard.key_up.k
		return :l if @args.inputs.keyboard.key_up.l
		return :m if @args.inputs.keyboard.key_up.m
		return :n if @args.inputs.keyboard.key_up.n
		return :o if @args.inputs.keyboard.key_up.o
		return :p if @args.inputs.keyboard.key_up.p
		return :q if @args.inputs.keyboard.key_up.q
		return :r if @args.inputs.keyboard.key_up.r
		return :s if @args.inputs.keyboard.key_up.s
		return :t if @args.inputs.keyboard.key_up.t
		return :u if @args.inputs.keyboard.key_up.u
		return :v if @args.inputs.keyboard.key_up.v
		return :w if @args.inputs.keyboard.key_up.w
		return :x if @args.inputs.keyboard.key_up.x
		return :y if @args.inputs.keyboard.key_up.y
		return :z if @args.inputs.keyboard.key_up.z

		return :comma if @args.inputs.keyboard.key_up.comma
		return :period if @args.inputs.keyboard.key_up.period
		return :question_mark if @args.inputs.keyboard.key_up.question_mark
		return :exclamation_point if @args.inputs.keyboard.key_up.exclamation_point
		return :semicolon if @args.inputs.keyboard.key_up.semicolon

		return :enter if @args.inputs.keyboard.key_up.enter
		return :space if @args.inputs.keyboard.key_up.space		
		return :shift if @args.inputs.keyboard.key_up.shift
		return :delete if @args.inputs.keyboard.key_up.backspace

		:none
	end

	# Checks if a letter is being pressed or held.
	# @return [Boolean]
	def self.letter?
		self.letter_hold != :none
	end


	# Returns a symbol for the number being held, or :none.
	# @return [Symbol]
	def self.number_hold
		return 1 if @args.inputs.keyboard.key_held.one
		return 2 if @args.inputs.keyboard.key_held.two
		return 3 if @args.inputs.keyboard.key_held.three
		return 4 if @args.inputs.keyboard.key_held.four
		return 5 if @args.inputs.keyboard.key_held.five
		return 6 if @args.inputs.keyboard.key_held.six
		return 7 if @args.inputs.keyboard.key_held.seven
		return 8 if @args.inputs.keyboard.key_held.eight
		return 9 if @args.inputs.keyboard.key_held.nine
		return 0 if @args.inputs.keyboard.key_held.zero
		:none
	end

	# Returns a symbol for the number being pressed, or :none.
	# @return [Symbol]
	def self.number
		return 1 if @args.inputs.keyboard.key_down.one
		return 2 if @args.inputs.keyboard.key_down.two
		return 3 if @args.inputs.keyboard.key_down.three
		return 4 if @args.inputs.keyboard.key_down.four
		return 5 if @args.inputs.keyboard.key_down.five
		return 6 if @args.inputs.keyboard.key_down.six
		return 7 if @args.inputs.keyboard.key_down.seven
		return 8 if @args.inputs.keyboard.key_down.eight
		return 9 if @args.inputs.keyboard.key_down.nine
		return 0 if @args.inputs.keyboard.key_down.zero
		:none
	end

	# Returns a symbol for the number being released, or :none.
	# @return [Symbol]
	def self.number_up
		return 1 if @args.inputs.keyboard.key_up.one
		return 2 if @args.inputs.keyboard.key_up.two
		return 3 if @args.inputs.keyboard.key_up.three
		return 4 if @args.inputs.keyboard.key_up.four
		return 5 if @args.inputs.keyboard.key_up.five
		return 6 if @args.inputs.keyboard.key_up.six
		return 7 if @args.inputs.keyboard.key_up.seven
		return 8 if @args.inputs.keyboard.key_up.eight
		return 9 if @args.inputs.keyboard.key_up.nine
		return 0 if @args.inputs.keyboard.key_up.zero
		:none
	end

	# Checks if a number is being held.
	# @return [Boolean]
	def self.number_hold?
		self.number_hold != :none
	end

	# Checks if a number is being pressed.
	# @return [Boolean]
	def self.number?
		self.number != :none
	end



	# Returns a symbol for the direction being held, or :none.
	# @return [Symbol]
	def self.direction_hold
		return :up if @args.inputs.keyboard.key_held.up
		return :down if @args.inputs.keyboard.key_held.down
		return :left if @args.inputs.keyboard.key_held.left
		return :right if @args.inputs.keyboard.key_held.right

		return :up if self.letter_hold == :w
		return :down if self.letter_hold == :s
		return :left if self.letter_hold == :a
		return :right if self.letter_hold == :d			

		:none
	end

	# Returns a symbol for the direction being pressed, or :none.
	# @return [Symbol]
	def self.direction
		return :up if @args.inputs.keyboard.key_down.up
		return :down if @args.inputs.keyboard.key_down.down
		return :left if @args.inputs.keyboard.key_down.left
		return :right if @args.inputs.keyboard.key_down.right

		return :up if self.letter == :w
		return :down if self.letter == :s
		return :left if self.letter == :a
		return :right if self.letter == :d			

		:none
	end

	# Returns a symbol for the direction being released, or :none.
	# @return [Symbol]
	def self.direction_up
		return :up if @args.inputs.keyboard.key_up.up
		return :down if @args.inputs.keyboard.key_up.down
		return :left if @args.inputs.keyboard.key_up.left
		return :right if @args.inputs.keyboard.key_up.right

		return :up if self.letter_up == :w
		return :down if self.letter_up == :s
		return :left if self.letter_up == :a
		return :right if self.letter_up == :d			

		:none
	end


	# Checks if a direction is being pressed or held.
	# @return [Boolean]
	def self.direction?
		self.direction_hold != :none
	end


	# Returns a symbol for the controller-style button being held, or :none.
	# @return [Symbol]
	def self.button_hold
		return :A if self.letter_hold == :j
		return :B if self.letter_hold == :k
		return :X if self.letter_hold == :l
		return :Y if self.letter_hold == :semicolon

		return :A if self.letter_hold == :c
		return :B if self.letter_hold == :x
		return :X if self.letter_hold == :z
		return :Y if self.letter_hold == :shift

		return :START if self.letter_hold == :enter
		return :SELECT if self.letter_hold == :space	

		:none	
	end

	# Returns a symbol for the the controller-style button being pressed, or :none.
	# @return [Symbol]
	def self.button
		return :A if self.letter == :j
		return :B if self.letter == :k
		return :X if self.letter == :l
		return :Y if self.letter == :semicolon

		return :A if self.letter == :c
		return :B if self.letter == :x
		return :X if self.letter == :z
		return :Y if self.letter == :shift

		return :START if self.letter == :enter
		return :SELECT if self.letter == :space	

		:none	
	end

	# Returns a symbol for the the controller-style button being released, or :none.
	# @return [Symbol]
	def self.button_up
		return :A if self.letter_up == :j
		return :B if self.letter_up == :k
		return :X if self.letter_up == :l
		return :Y if self.letter_up == :semicolon

		return :A if self.letter_up == :c
		return :B if self.letter_up == :x
		return :X if self.letter_up == :z
		return :Y if self.letter_up == :shift

		return :START if self.letter_up == :enter
		return :SELECT if self.letter_up == :space

		:none	
	end


	# Checks if a the controller-style button is being pressed or held.
	# @return [Boolean]
	def self.button?
		self.button_hold != :none
	end


	# Returns a symbol for the confirmation button being held, or :none.
	# @return [Symbol]
	def self.confirm_hold
		return :yes if self.button_hold == :A || self.button_hold == :START
		return :no if self.button_hold == :B
		:none
	end

	# Returns a symbol for the confirmation button being pressed, or :none.
	# @return [Symbol]
	def self.confirm
		return :yes if self.button == :A || self.button == :START
		return :no if self.button == :B
		:none
	end

	# Returns a symbol for the confirmation button being released, or :none.
	# @return [Symbol]
	def self.confirm_up
		return :yes if self.button_release == :A || self.button_release == :START
		return :no if self.button_release == :B
		:none
	end

	# Checks if a confirmation button is being pressed or held.
	# @return [Boolean]
	def self.confirm?
		self.confirm_hold != :none && self.confirm_hold != :no
	end
end

# Method Extension Notes:
#  - Extend is for class methods, include is for instance methods
#  - Module methods can take args
#  - "Variables" in modules can be defined like in classes, but not the regular way
# 
# module ArgsMethods
# 	def greeting
# 		"こんばんは"
# 	end

# 	def say_hello args
# 		args.outputs.labels << [400, 400, greeting]
# 	end
# end

# NOTE: I want to explain my design choices here: 
# 			First, this class exists to shorten the number of characters I need to type to read an input. 
# 				i.e. args.inputs.keyboard.key_down.space (35 characters) vs. Keyboard.button == :select (26 characters)
#				Second, I often find myself wanting to read inputs in a switch statement, but I don't think Dragon
# 				Ruby makes that easy in any way.
# 			Third, this facilitates preset types of inputs. Directions are their own group, as are Numbers, 
# 				Buttons (like WASD and other standard keyboard controls), Letters and Confirmation. They
# 				all share a common naming convention, which makes them easy to remember or guess.