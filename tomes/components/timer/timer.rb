require 'app/tomes/components/timer/timer_converter.rb'

# A basic timer. This version starts at zero (or some given time) and counts *up*.
# @note This class operates under the assumption that #count will be called every frame it is active.
class Timer
	include TimerConverter

	private
	attr_writer :name
	attr_accessor :frames, :on

	def initialize(name, initial_time_in_frames = 0)
		self.name = name
		self.frames = initial_time_in_frames
		self.on = false
	end

	public

	# @attribute [r] name
	# 	@return [String] The given name of the Timer.
	# @attribute [r] on
	# 	#return [Boolean] The current state of the Timer.
	attr_reader :name, :on

	# This increments the frame counter every tick the Timer is active.
	# @return [Void]
	def count
		return unless self.on?
		self.frames += 1
	end

	# Sets the timer active.
	# @return [Void]
	def turn_on
		self.on = true
	end
	alias start turn_on

	# Deactivates the timer in place.
	# @return [Void]
	def turn_off
		self.on = false
	end
	alias stop turn_off

	# Turns activates the timer if inactive; deactivates the timer if active.
	def flip!
		if on?
			turn_off
		else
			turn_on
		end
	end

	# Sets the frame counter to a given value.
	# @param time_in_frames [Integer]
	# @return [Void]
	def set_time!(time_in_frames)
		self.frames = time_in_frames
	end
	alias set! set_time!

	# Resets the frame counter to zero.
	# @return [Void]
	def reset!
		self.frames = 0
	end

	# Returns whether the frame counter is zero. It is 'true' if the count is above zero and 'false' otherwise.
	# Other objects or methods can use #signal to determine logic. (i.e. Player takes no damage if #signal is true.)
	# @return [Boolean]
	def signal
		frames > 0
	end
	alias true? signal

	alias on? on

end