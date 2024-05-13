require 'app/tomes/spells/librarian/librarian.rb'

# Tomes itself is being ignored here because its folders must be loaded in a 
# specific order and reloading them again on line 13 would be redundant.
IGNORED_FILES = 
  Librarian::dredge_directory('app/tomes') + ['app/main.rb', 'app/tick.rb']

Librarian::require_directory('app/tomes/alterations')
Librarian::require_directory('app/tomes/spells')
Librarian::require_directory('app/tomes/components')
Librarian::require_directory('app/tomes/conjurations')

# Load the rest of the game.
Librarian::require_directory('app', ignore: IGNORED_FILES )

# Your game's code goes in here.
require 'app/tick.rb'
