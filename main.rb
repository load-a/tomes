require 'app/tomes/spells/librarian/librarian.rb'

IGNORED_FILES = Librarian::dredge_directory('app/tomes') + ['app/main.rb', 'app/tick.rb']

# The order these directories are loaded matters.
Librarian::require_directory('app/tomes/alterations')
Librarian::require_directory('app/tomes/spells')
Librarian::require_directory('app/tomes/components')
Librarian::require_directory('app/tomes/conjurations')

# Load the rest of the game.
Librarian::require_directory('app', ignore: IGNORED_FILES )

require 'app/tick.rb'