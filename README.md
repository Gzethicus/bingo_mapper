# Bingo Mapper
A little tool to help you get a visual representation of where you can complete goals to help you routing when playing [Rain World Bingo](https://github.com/Nacu0021/BingoMode).

## How to use
Download the latest release and launch the executable, or alternatively clone this repository and build it using godot.<br>
Launch the executable, get a bingo board string in your clipboard from the game directly or from a fellow bingo player, and click the import button.<br>
Importing a board sets the map for the appropriate slugcat, clears all previous markers, and auto-creates markers for some goals.

## Features
* Board import from string;
* Automatically show the appropriate map for the board's slugcat;
* Auto-places markers for :
    * Bomb Toll;
    * Collect Pearl (specific);
    * Echo;
    * Enter Region From;
    * Green Neuron;
    * Moon Cloak;
    * Saint Delivery;
    * Arena Unlock;
    * Vista (place all in a given region)
* Extra vista toggle to auto-place the mod's custom vistas (require reimporting the board);
* Manual placement/removal of markers linked to goals.

## Controls
* LMB :
  * on board : select a goal;
  * on map : place a marker linked to selected goal;
* MMB : drag view around (note : you can't drag out of map bounds);
* RMB : remove **ALL** markers near your cursor;
* Scroll Wheel : zoom in/out.
