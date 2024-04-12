require 'app/tomes/components/timer/timer.rb'

# A basic timer. This version starts at some given time and counts *down*.
# @note This class operates under the assumption that #count will be called every frame it is active.
class CooldownTimer < Timer

	private

	# @!attribute reset_time
	# 	The default time (in frames) to reset to.
	attr_accessor :reset_time

	def initialize(name, reset_time_in_frames = 60)
		super
		self.on = false
		self.reset_time = reset_time_in_frames
	end

	public
	attr_reader :reset_time

	# Returns whether the frame counter is zero. It is 'true' if the count is at zero and 'false' otherwise.
	# Other objects or methods can use #signal to determine logic. (i.e. Player can't attack if #signal is true.)
	# @return [Boolean]
	def signal
		frames == 0
	end

	# This decrements the frame counter every tick the Timer is active.
	# @param auto_reset [Boolean] 
	# 	If this is 'true' the timer will reset the frame counter to the #reset_time the frame after it hits zero.
	# @param auto_restart [Boolean] 
	# 	If this is 'true' the timer will reset itself and immediately start itself again after it hits zero.
	# 	You do not have to set auto_reset to 'true' if this is set to 'true'.
	# @return [Void]
	def count(auto_reset: false, auto_restart: false)
		return unless self.on?

		if frames > 0 and on?
			self.frames -= 1

		else
			stop
			reset! if auto_reset || auto_restart
			self.on = true if auto_restart

		end
	end

	# Sets the frame counter to the #reset_time.
	def reset!
		self.frames = reset_time
	end


end