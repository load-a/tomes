require 'app/tomes/constants/constants.rb'

module TimeConverter
	extend self
	def formatted_time_table(hours: 0, minutes: 0, seconds: 0, frames: 0)
		{
			frames: frames%60,
			seconds: seconds%60,
			minutes: minutes%60,
			hours: hours
		}
	end
	alias calculate_current_time formatted_time_table

	def frames_to_seconds(frames)
		frames / ASSUMED_FRAMES_PER_SECOND
	end

	def seconds_to_minutes(seconds)
		seconds / 60
	end
	alias minutes_to_hours seconds_to_minutes

	def convert_time_to_seconds(hours: 0, minutes: 0, seconds: 0, frames: 0)
		(hours * 60**2) + (minutes * 60) + seconds + (frames / ASSUMED_FRAMES_PER_SECOND)
	end

	def seconds_to_frames(seconds)
		seconds * ASSUMED_FRAMES_PER_SECOND
	end

end