require 'app/tomes/components/timer/timer_converter.rb'

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
	attr_reader :name, :on

	def count
		self.frames += 1
		self.on = true
	end

	def stop
		self.on = false
	end

	def set_time!(time_in_frames)
		self.frames = time_in_frames
	end
	alias set! set_time!

	def reset!
		self.frames = 0
	end

	# Use this attribute to affect other objects. (i.e. Disable player control when #signal is true)
	def signal
		frames > 0
	end
	alias true? signal

	alias on? on

end