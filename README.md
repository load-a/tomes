# Tomes
### A Library for the DragonRuby Game Engine
Version 0.1.0

## What is this?
These are some tools I created for the development of my own game. They have been expanded upon and reworked for more general-purpose use. 

## Motivation
These were created to fill a gap in the current engine. DragonRuby actually comes with a lot of supplemental material, but few of those were useful to me in my current project. Some of these were created to reduce the amount of keystrokes it takes to do something (i.e. `Keyboard.confirm?` instead of `args.inputs.keyboard.key_down.enter`); some things are just neat features I think might be useful in a variety of applications (i.e. using `dice` or `deck_of_cards` to mimic real-life randomness in games); still others were created as tools for my specific game, but I thought might be very handy to others (i.e. the `SpriteSheet` class). 

It is my hope that others will be able to use this to make developing their own games easier.

## How to Install
DragonRuby contains all relevant game files within each project folder, individually. Therefore, using this library as a normal gem won't work. You can download this repo itself and copy it into your `mygame/app/` folder.

## How to Use
The `tomes` folder should be required by your game's `main` file. Specifically you should have `require 'app/tomes/...` for any files you want to use. (`require_relative` won't work.) I believe most dependencies between files in Tomes have been taken care of, but if you run into a problem see if that's not the issue. Once you have everything running you can develop your game as normal, using all the methods and classes as you wish. Feel free to edit the files to fit your unique situation.

## In-depth Documentation?
I will formally include this in a later update (once I learn how to extract documentation from Ruby comments). Until then, I think the comments in the files will be sufficient to get an idea for how things work. I've done my best to use accurate, descriptive names for things, which should also help. 

## How to Contribute
I am very much a beginner when it comes to GitHub so I can't say much about pull requests and such. However, if you notice any bugs or have any suggestions for improvements or other functionality please do contact me. You can do so through GitHub or you can find me in the DragonRuby Discord channel as `saramir.`