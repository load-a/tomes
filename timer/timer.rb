require 'app/tomes/timer/timer_converter.rb'

class Timer
	include TimerConverter

	private
	attr_writer :name, :state
	attr_accessor :frames, :on

	def initialize(name, initial_time_in_frames = 0)
		self.name = name
		self.frames = initial_time_in_frames
		self.state = false
		self.on = false
	end

	public
	attr_reader :name

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

	def state
		frames > 0
	end

	def true?
		state == true
	end

	def on?
		on == true
	end

end