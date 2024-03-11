# This is the way DragonRuby recommends setting up multiple file requirements.

# All basic files are 'required' here, ignoring the ones in the 'app' directory itself.
# @note I recommend you remove this from 'tomes/' and put in your 'app/' folder.
require 'app/require_file_module.rb'
RequireFile::require_all_ruby_files

# The game itself is here and must be required *last*.
require 'app/tick.rb'