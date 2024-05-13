# Tomes
### A Library for the DragonRuby Game Engine
Version 2.0.0

## What is this?
These are some tools I created for my own projects. Some of the contents include input handlers, geometry modules and a file loader. 

## Motivation
These were created to fill a gap in the DragonRuby game engine. DragonRuby actually comes with a lot of supplemental material, but few of the things it comes with were useful to me in my current project. It is my hope that others will be able to use this to make developing their own games easier.

## How to Install
DragonRuby is a self-contained runtime; all the files needed to run your game must be somewhere in the `app` directory. Therefore, using this library as a normal gem won't work. I recommend copying the entire repo (minus the documentation) and replacing the contents of `app/` with it. (It comes with `main.rb` and `tick.rb` files.) 
This library was made for DragonRuby version 5.17.

## How to Use
Just copy and paste the repo into your `app` folder. The `main.rb` file will automatically load Tomes, and the rest of your game files before calling the `#tick` method to run your game. You can then use all the tools and classes freely. I recommend not editing Tomes and opening up or inheriting from its classes and modules if you want to adjust them.

### Using the Librarian Module
If you only want to load some files but not others, or want to load other files in `mygame/`, you can change the `Librarian::require_directory` statements to fit your needs. Just provide the directory names without the trailing forward slash. You should not change the order in which the Tomes directories are called (don't load `conjurations/` before `spells/`, for example).

This module loads files in alphabetical order. If your files' dependencies don't reflect this, you will need to `require` other files manually. It is recommended you do this on the files themselves, instead of in a "require farm".

## In-depth Documentation
The full documetnation can be found [here](https://load-a.github.io/tomes/).

### Brief Functionality
Here's a rundown of what's included here and how it's intended to be used:

- **Alterations**: These change the runtime itself. Certain tools require these changes to function properly.
	- A `#this_class` method has been added to the `Object` class. It's just another way of calling `self.class`.
	- `#is_an?` has been aliased with `#is_a?` for the `Object` class.
	- When a `Symbol` or `Numeric` is threequelled (`===`) with an `Array` (such as in a `case` statement) it will check for an instance of itself in said Array.
	- `#method_function` has been added to the `Module` class. This is to conform with Rubocop's style guidelines.
- **Spells**: These are fundamental modules with no dependencies beyond their own folders.
	- `args_update.rb`: Gives classes/modules an `#update` method in which `args` should be passed as an argument. This method should be called every frame and allows things such as the Mouse and Keyboard modules to operate.
	- `geometry/`: various geometric modules that have been made to work with DragonRuby's primitives system. Very useful for creating hitboxes, among other things.
	- `librarian.rb`: This is the file loader. It can also list files or directories, and recursively list all the files within a set of nested directories.
	- `group.rb` is a pair of modules that may make keeping a class-level list of object implementations easier.
	- `identifiable.rb` is a pair of modules that may make assigning identifiers to classes and objects easier. 
- **Components**: These are base level classes that also have no outward dependencies.
	- `Color`: A module that comes with predefined hashes for various colors. You can merge it with primitive hashes.
	- `constants/`: various constants, including screen size, and a sprite table.
	- `deck_builder/`: A family of classes that you can use to make and use Cards. You can get *very* detailed with these. I will release some example files in a future update (once I iron out all the runtime differences). A standard 52-card deck with jokers will be demonstrated, as well as a Hanafuda deck and a mahjong tile set.
	- `errors/`: Comes with `TomesError` which I will use for this library, and `Error` which you can use for your own custom error types.
	- `Selector`: An object that holds and remembers two elements of data. 
	- `timer/`: Provides a count-up and countdown timer, along with a module for easily displaying and converting between frames and time.
- **Conjurations**: Things that depend on the previous three categories.
	- `DevTools`: A module with some basic methods to quickly render things.
	- `Keyboard` and `Mouse`: Input handlers that are a little more convenient than DragonRuby's default way of managing inputs. `Keyboard` has some preset configurations of buttons (confirm, controller, wasd, etc.) and allows you to check inputs via case statement.
	- `Renderer`: A module to handle the actual rendering for your game. Can be set up to handle things like render priority and comes with a `render_list` so you can keep things in one place.

## How to Contribute
I am very much a beginner when it comes to GitHub so I can't say much about pull requests and such. However, if you notice any bugs or have any suggestions for improvements or other functionality please do contact me. You can do so through GitHub or you can find me in the DragonRuby Discord channel as `saramir.`