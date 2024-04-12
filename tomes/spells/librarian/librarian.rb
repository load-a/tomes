# A module to extend DragonRuby's file handling capabilities. 
# @note This module only handles '.rb' files and directories.
module Librarian
	extend self

	# Requires all .rb files in a given directory. 
	# 	Files can be ignored via the ignore parameter or by including them in a folder with a dot in its name.
	# 	Search starts at the 'app' directory by default. (DragonRuby will not accept files outside of 'mygame/'.)
	# 	Ignores this file and 'main.rb' by default.
	# This is the method you're most likely to use from this module.
	# @note This method 'requires' the files in each directory in alphabetical order. There is no easy way around this.
	# @param directory [String] The directory that contains the files to be required. Defaults to 'app'.
	# @param ignore [Array<String>] A list of all the files you want ignored. Defaults to 'app/main.rb'
	# 	@note The full file path (starting with 'app/') must be specified.
	def require_directory( directory = 'app', ignore: ['app/main.rb', 'app/tick.rb'] )
		
		dredge_directory(directory).reject { |file| ignore.include? file }
																.each { |file| require file }
	end

	# Recursively gathers the file paths for all files in a given directory and its subdirectories.
	# @param directory [String] The directory name (relative to 'mygame/') with no trailing forward-slash.
	# @param files [Array] This is the memo variable. Leave it empty if calling this method manually.
	# @return [Array<Strings>]
	def dredge_directory(directory, files = [])
		header = directory + '/'

		files << list_file_paths(directory)
		folders = list_directories(directory)

		return files.flatten if folders.empty?

		folders.map {|folder| dredge_directory(header+folder, files.flatten) }.flatten.uniq
	end

	# Lists the full (DragonRuby) path for all .rb files in a given directory.
	# @param directory [String] The directory name (relative to 'mygame/') with no trailing forward-slash.
	# @return [Array<Strings>]
	def list_file_paths(directory)
		$gtk.list_files(directory).select { |file| file.include? '.rb' }
															.map { |file| directory + '/' + file }
															.flatten
	end

	# Lists any entries in a directory that lack a dot in its name. Does not list the root directory.
	# @param root_directory [String] The root directory name (relative to 'mygame/') with no trailing forward-slash.
	# @return [Array<Strings>] 
	def list_directories(root_directory)
		$gtk.list_files(root_directory).reject { |file| file.include? '.' }.flatten
	end

end