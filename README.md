# Four-Way One-Player Pong
A four-way (horizontal and vertical), single-player (you control all paddles), never-ending (the game restarts when you loose - be prepared!) version of pong.

## Screenshots

Gameplay - 12 points, with ~4.7-millisecond delay between frames (ie. easy):

![gameplay - 12 points](screenshots/12-points.png?raw=true "Gameplay - 12 Points")

Gameplay - after failing, the ball is reset to a random location and direction, its speed is reset, and the initial direction of travel is indicated:

![gameplay - after failing](screenshots/after-fail.png?raw=true "Gameplay - after failing")

## History
Original development stopped 2014-09-02. Feel free to open a pull request if you want to continue it!

## Compilation
You can compile the `.bas` (FreeBASIC) file with the [freebasic compiler](https://sourceforge.net/projects/fbc/files/ "FreeBASIC Compiler on SourceFourge") (last tested with `fbc` version 1.05.0):
```
fbc pong.bas
```

## Known Issues
- If the ball hits the *side* of a paddle, it will 'stick'.
  - This results in gaining score very rapidly, but inevitable failure
