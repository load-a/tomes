require 'app/tomes/constants/constants.rb'

module TimerConverter

	private
	attr_accessor :seconds, :minutes, :hours

	TIME_FORMAT = '%<hours>02i:%<minutes>02i:%<seconds>02i.%<frames>02if'

	public

	def full_status
		calculate_current_time
		{
			name: name,
			frames: self.frames,
			seconds: self.seconds.round(2),
			minutes: self.minutes.round(2) ,
			hours: self.hours.floor ,
			on: self.on,
			state: state
		}
	end
	alias status full_status

	def formatted_time
		TIME_FORMAT % formatted_time_table
	end

	def formatted_time_table
		calculate_current_time
		{
			frames: self.frames%60,
			seconds: self.seconds%60,
			minutes: self.minutes%60,
			hours: self.hours
		}
	end

	def calculate_current_time
		self.seconds = frames_to_seconds(self.frames)
		self.minutes = seconds_to_minutes(self.seconds)
		self.hours = minutes_to_hours(self.minutes)
	end

	def frames_to_seconds(frames)
		frames / ASSUMED_FRAMES_PER_SECOND
	end

	def seconds_to_minutes(seconds)
		seconds / 60
	end
	alias minutes_to_hours seconds_to_minutes

end