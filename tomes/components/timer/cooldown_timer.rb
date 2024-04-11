require 'app/tomes/components/timer/timer.rb'

class CooldownTimer < Timer

	private
	attr_accessor :reset_time
	def initialize(name, reset_time_in_frames = 0)
		super
		self.on = false
		self.reset_time = reset_time_in_frames
	end

	public
	attr_reader :reset_time

	def signal
		frames == 0
	end

	def count(auto_reset: false, auto_restart: false)
		if frames > 0 and on?
			self.frames -= 1

		else
			stop
			reset! if auto_reset || auto_restart
			self.on = true if auto_restart

		end
	end

	def reset!
		self.frames = reset_time
	end

	def turn_on
		self.on = true
	end

	def turn_off 
		self.on = false
	end

	def flip!
		if on?
			turn_off
		else
			turn_on
		end
	end

end