# Demo Keys (macOS only)
A simple solution for automatically typing sequences of text, when scripting product demos.

### See it in action

I provide a list of blocks of text to type, then I cycle through them triggering their playback, by pressing command+shift+p. 

<img width="50%" src="demo.gif"/>

### Setup

 1. Install Hammerstone
 2. Give Hammerstone accessbility permissions
    1. Run Hammerstone (Command+Spacebar, Type Hammerstone)
    1. Go to it's Preferences (found via the system tray menu, look for a hammer)
    1. Press Enable Accessibility, and it will take you System Settings -> Accessibility. Enable Hammerstone
 3. Restart hammerstone and verify that accessility permissions are given
 4. Copy the init.lua to hammerstone's config location (This is file is what Hammerstone calls its Config)

        ./sync.sh

 5. Edit the array of strings at the top of `~/.hammerspoon/init.lua` to set your sequence of text blocks to paste.
 1. Now select Reload Config from Hammerstone's menu
 6. To run a demo
    1. Go to an input box and press command+shift+p to trigger the first text block
    1. To trigger the next block, press command+shift+p again.
 1. Press shift+option+P to restart the sequence

This doesn't have a great workflow for saving/editing multiple demo plans, for now you'll just have to modify the `~/.hammerspoon/init.lua` file with new keyboard sequences.