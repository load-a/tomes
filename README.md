# Tomes
### A Library for the DragonRuby Game Engine
Version 0.2.0

## What is this?
These are some tools I created for the development of my own game. They have been edited slightly to make them more general-use. 

## Motivation
These were created to fill a gap in the engine. DragonRuby actually comes with a lot of supplemental material, but few of those were useful to me in my current project. Some of these were created to reduce the amount of keystrokes it takes to do something (i.e. `Keyboard.confirm?` instead of `args.inputs.keyboard.key_down.enter`); some things are just neat features I think might be useful in a variety of applications (i.e. using `dice` or `deck_of_cards` to mimic real-life randomness in games); still others were created as tools for my specific game, but I thought might be very handy to others (i.e. the `SpriteSheet` class). 

It is my hope that others will be able to use this to make developing their own games easier.

## How to Install
DragonRuby contains all relevant game files within each project folder, individually. Therefore, using this library as a normal gem won't work. You can download this repo itself and copy it into your `mygame/app/` folder. Note that these were made for version 5.17 and may not work with earlier projects.

## How to Use
The `tomes/` folder should be required by your game's `main.rb` file. Specifically you should have `require 'app/tomes/...` for any files you want to use. `require_relative` is not an available method in this runtime. All dependencies should be handled within in each file individually. 

### Optional Usage Instructions
Included are three files not in their own directory: `main.rb`, `require_file_module.rb` and `tick.rb`. I recommend moving all three to your project's `app/` folder (and replace the default `main.rb` file). `main.rb` will use the `RequireFile` module to recursively `require` *every file in every directory* within `app/`. Files outside of directories--like these three, themselves--and any directory with a period in its name will be ignored. You can use `RequireFile` to only require certain directories if you wish.

## In-depth Documentation
I've used Yard to generate documentation from comments. You can view it through the `doc/_index.html` file. As this library is still in development, not everything is documented, or may not be documented properly. Please let me know of any bad information you get from the documentation or comments and I will. fix them in future updates. 

## How to Contribute
I am very much a beginner when it comes to GitHub so I can't say much about pull requests and such. However, if you notice any bugs or have any suggestions for improvements or other functionality please do contact me. You can do so through GitHub or you can find me in the DragonRuby Discord channel as `saramir.`