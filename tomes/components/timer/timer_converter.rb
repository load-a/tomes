module TimerConverter

	private
	attr_accessor :seconds, :minutes, :hours

	TIME_FORMAT = '%<hours>02i:%<minutes>02i:%<seconds>02i.%<frames>02if'

	public

	# Puts the values of each attribute into a hash.
	# @return [Hash]
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

	# Shows the time in a standard way.
	# @return [String]
	def formatted_time
		TIME_FORMAT % formatted_time_table
	end

	# Shows the time in a standard format, but as a Hash.
	# @return [Hash]
	def formatted_time_table
		calculate_current_time
		{
			frames: self.frames%60,
			seconds: self.seconds%60,
			minutes: self.minutes%60,
			hours: self.hours
		}
	end

	# Calculates the *total* #seconds, #minutes and #hours from the frame count.
	# @return [Void]
	def calculate_current_time
		self.seconds = frames_to_seconds(self.frames)
		self.minutes = seconds_to_minutes(self.seconds)
		self.hours = minutes_to_hours(self.minutes)
	end

	# Converts a given amount of frames to seconds. 
	# @note This method returns an Integer.
	# @param frames [Integer]
	# @return [Integer]
	def frames_to_seconds(frames)
		frames / ASSUMED_FRAMES_PER_SECOND
	end

	# Divides a given number by 60. This function also doubles as a minutes-to-hours converter.
	# @param seconds [Integer]
	# @return [Integer]
	def seconds_to_minutes(seconds)
		seconds / 60
	end
	alias minutes_to_hours seconds_to_minutes

end