# Tomes
### A Library for the DragonRuby Game Engine
Version 1.0.0

## What is this?
These are some tools I created for my own projects. Some of the contents include input handlers, geometry modules and a file loader. 

## Motivation
These were created to fill a gap in the DragonRuby game engine. DragonRuby actually comes with a lot of supplemental material, but few of the things it comes with were useful to me in my current project. It is my hope that others will be able to use this to make developing their own games easier.

## How to Install
DragonRuby is a self-contained runtime; all the files needed to run your game must be somewhere in the `app` directory. Therefore, using this library as a normal gem won't work. I recommend copying the entire repo and replacing the contents of `app/` with it. (It comes with `main.rb` and `tick.rb` files.) 
This library was made for DragonRuby version 5.17.

## How to Use
Just copy and paste the repo into your `app` folder. The `main.rb` file will automatically load Tomes, and the rest of your game files before calling the `#tick` method to run your game. You can then use all the tools and classes freely. I recommend not editing Tomes and opening up or inheriting from its classes and modules if you want to adjust them.

### Using the Librarian Module
If you only want to load some files but not others, or want to load other files in `mygame/`, you can change the `Librarian::require_directory` statements to fit your needs. Just provide the directory names without the trailing forward slash. You should not change the order in which the Tomes directories are called (don't load `conjurations/` before `spells/`, for example).

This module loads files in alphabetical order. If your files' dependencies don't reflect this, you will need to `require` other files manually. It is recommended you do this on the files themselves, instead of in a "require farm".

## In-depth Documentation
This version was a major overhaul of the previous one. A lot of documentation needs to be rewritten. I'll include the yard doc in a future update.

### Brief Functionality
Here's a rundown of what's included here and how it's intended to be used:

- **Alterations**: These change the runtime itself. Certain tools require these changes to function properly.
	- `this_class.rb`: adds a `#this_class` method to the `Object` class. It's just another way of calling `self.class`.
	- `threequel.rb`: When a Symbol or Numeric is threequelled (`===`) with an Array (such as in a `case` statement) it will check for an instance of itself in said Array.
- **Spells**: These are fundamental modules with no dependencies beyond their own folders.
	- `args_update.rb`: Gives classes an `#update` method where `args` should be passed as an argument. This method should be called every frame and allows things such as the Mouse and Keyboard classes to operate.
	- `geometry/`: various geometric modules that have been made to work with DragonRuby's primitives system. Very useful for creating hitboxes, among other things.
	- `librarian.rb`: This is the file loader. It can also list files or directories, and recursively list all the files within a set of nested directories.
- **Components**: These are base level classes that also have no outward dependencies.
	- `color/`: A class that comes with predefined hashes for various colors. You can merge it with primitive hashes.
	- `constants/`: various constants, including screen size, and a sprite table.
	- `deck_builder/`: A family of classes that you can use to make decks of cards. You can get *very* detailed with this. It comes with a `.txt` file that demonstrates how to build a standard 52-card deck (including Jokers, suits, colors), a Hanafuda deck (including point values, month order and category names), and a mahjong tile set. If you convert the demo into a `.rb` file you can actually run it and generate a Mahjong deck (the demo works in a standard terminal, not in DragonRuby). It also comes with some modules that let you manipulate the deck in various ways.
	- `errors/`: Comes with `TomesError` which I will use for this library, and `Error` which you can use for your own custom error types.
	- `selector/`: An object that holds and remembers two elements of data. 
	- `timer/`: A count-up and countdown timer, along with a module for easily displaying and converting between frames and time.
- **Conjurations**: Things that depend on the previous three categories.
	- `dev_tools/`: A class with some basic methods to quickly render things.
	- `keyboard/` and `mouse/`: Input handlers that are a little more convenient than DragonRuby's default way of managing inputs. `Keyboard` has some preset configurations of buttons (confirm, controller, wasd + jkl;, etc.) and allows you to check inputs in a switch statement.
	- `renderer/`: A class to handle the actual rendering for your game. Can be set up to handle things like render priority and comes with a `render_list` so you can keep things in one place.

## How to Contribute
I am very much a beginner when it comes to GitHub so I can't say much about pull requests and such. However, if you notice any bugs or have any suggestions for improvements or other functionality please do contact me. You can do so through GitHub or you can find me in the DragonRuby Discord channel as `saramir.`