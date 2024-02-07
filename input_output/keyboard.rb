##
# This class presents an alternate way of reading keyboard input.
# Keyboard.update(args) must be called in the main tick method.
# Each method returns :none until their corresponding inputs are pressed, at which point they return the appropriate symbol.
# Reading combinations of keys may be problematic.

class Keyboard < ArgsObject

	##
	# These are the set of methods for basic keyboard input. 
	# Letters, numbers, some punctuation, enter and space are all recognized.
	
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


		:none
	end

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

		:none
	end

	def self.letter_release
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

		:none
	end

	def self.letter?
		self.letter_hold != :none
	end


	##
	# These methods read only numeric input.

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

	def self.number_release
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

	def self.number?
		self.number_hold != :none
	end


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

	##
	# These methods read only directional input; either WASD or the arrow keys.

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

	def self.direction_release
		return :up if @args.inputs.keyboard.key_up.up
		return :down if @args.inputs.keyboard.key_up.down
		return :left if @args.inputs.keyboard.key_up.left
		return :right if @args.inputs.keyboard.key_up.right

		return :up if self.letter_release == :w
		return :down if self.letter_release == :s
		return :left if self.letter_release == :a
		return :right if self.letter_release == :d			

		:none
	end


	def self.direction?
		self.direction_hold != :none
	end

	##
	# These methods treat the keyboard like a standard game controller. 
	# WASD-based and arrow-key-based configurations are accepted.

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

	def self.button_release
		return :A if self.letter_release == :j
		return :B if self.letter_release == :k
		return :X if self.letter_release == :l
		return :Y if self.letter_release == :semicolon

		return :A if self.letter_release == :c
		return :B if self.letter_release == :x
		return :X if self.letter_release == :z
		return :Y if self.letter_release == :shift

		return :START if self.letter_release == :enter
		return :SELECT if self.letter_release == :space

		:none	
	end


	def self.button?
		self.button_hold != :none
	end

	##
	# These methods are an offshoot of the previous Button methods. 
	# Their focus is on commonly used buttons for confirmation and denial.

	def self.confirm_hold
		return :yes if self.button_hold == :A || self.button_hold == :START
		return :no if self.button_hold == :B
		:none
	end

	def self.confirm
		return :yes if self.button == :A || self.button == :START
		return :no if self.button == :B
		:none
	end

	def self.confirm_release
		return :yes if self.button_release == :A || self.button_release == :START
		return :no if self.button_release == :B
		:none
	end

	def self.confirm?
		self.confirm_hold != :none && self.confirm_hold != :no
	end
end

# NOTE: I want to explain my design choices here: 
# 			First, this class exists to shorten the number of characters I need to type to read an input. 
# 				i.e. args.inputs.keyboard.key_down.space (35 characters) vs. Keyboard.button == :select (26 characters)
#				Second, I often find myself wanting to read inputs in a switch statement, but I don't know if Dragon
# 				Ruby makes that easy in any way.
# 			Third, this facilitates preset types of inputs. Directions are their own group, as are Numbers, 
# 				Buttons (like WASD and other standard keyboard controls), Letters and Confirmation. They
# 				all share a common naming convention, which makes them easy to remember (or guess).
