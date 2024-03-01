module RequireFile
	extend self

	# Lists the full (DragonRuby) path for all .rb files in a given directory
	def list_file_paths(directory)
		$gtk.list_files(directory).select { |file| file.include? '.rb' }
															.map { |file| directory + '/' + file }
															.flatten
	end

	# List all entries in a directory that lack a dot in its name. Does not list the root directory.
	def list_directories(root_directory)
		$gtk.list_files(root_directory).reject { |file| file.include? '.' }.flatten
	end

	# Recursively gathers the file paths for all files in a given directory.
	def dig_up_files(directory, files = [])
		header = directory + '/'

		files << list_file_paths(directory)
		folders = list_directories(directory)

		return files if folders.empty?
			
		folders.map {|folder| dig_up_files(header+folder, files.flatten) }.flatten.uniq
	end

	# Requires all .rb files in a given directory. 
	# 	Files can be ignored via the ignore parameter or by including them in a folder with a dot in its name.
	# @param directory [String] The directory that contains the files to be required. Defaults to 'app'.
	# @param ignore [Array<String>] A list of all the files you want ignored. Defaults to 'app/main.rb'
	# 	@note The full file path (starting with 'app/') must be specified.
	def require_all_ruby_files(directory: 'app', ignore: ['app/main.rb'])
		dig_up_files(directory).reject { |file| ignore.include? file }
														.each {|file| require file}
	end
end