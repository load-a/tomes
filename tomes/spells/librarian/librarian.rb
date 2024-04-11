# A module to extend DragonRuby's file handling. 
# @note These methods are built to only handle .rb files and directories.
module Librarian
	extend self

	# Requires all .rb files in a given directory. 
	# 	Files can be ignored via the ignore parameter or by including them in a folder with a dot in its name.
	# 	Search starts at the 'app' directory by default. (DragonRuby will not accept files outside of 'mygame/'.)
	# 	Ignores this file and 'main.rb' by default.
	# Files are required in Alphabetical order. There is no easy way around this.
	# @param directory [String] The directory that contains the files to be required. Defaults to 'app'.
	# @param ignore [Array<String>] A list of all the files you want ignored. Defaults to 'app/main.rb'
	# 	@note The full file path (starting with 'app/') must be specified.
	def require_directory( directory = 'app', ignore: ['app/main.rb', 'app/tick.rb'] )
		
		puts dredge_directory(directory).reject { |file| ignore.include? file }
		dredge_directory(directory).reject { |file| ignore.include? file }
																.each { |file| require file }
	end

	# Recursively gathers the file paths for all files in a given directory.
	def dredge_directory(directory, files = [])
		header = directory + '/'

		files << list_file_paths(directory)
		folders = list_directories(directory)

		return files.flatten if folders.empty?

		folders.map {|folder| dredge_directory(header+folder, files.flatten) }.flatten.uniq
	end

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

end