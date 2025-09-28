# AHK-Soundboard

Turn your keyboard into a customisable soundboard by using AutoHotkey.

## General
When I was searching for a soundboard application, I couldn't find any that fit all my needs. I wanted to set up keybinds that trigger sounds (which both I can hear and also my friends in the voice chat), but without interfering with the regular use of my keyboard. This meant that I didn't want to have the keys I pressed registered outside the soundboard when playing a sound while also not delaying important regular key presses not meant for playing sounds.

I didn't intend to publish my script, but since I've been happy using it for a few years now, I finally uploaded it to GitHub. But keep in mind that this is not a simple executable that you run and you're done.

## Usage
- Run the AHK script to start the soundboard (optionally add it to autostart; there are several articles on how to do this).
- Play sounds from files by pressing Ctrl + F{N} + {M} (N and M standing for numbers, e.g., Ctrl + F1 + 2). The order of the key presses is important, and you need to have all of them pressed at the same time for playing the sound.
- When playing the sound, the function and number keys won't register to any other application (but Ctrl will), so that you don't accidentally trigger something unwanted.
- As a downside of the program, when pressing Ctrl + F{N}, it will only be registered after releasing the function key (but these shortcuts are rarely needed anyways). Ctrl + {M} will still work instantly.
- Hold Ctrl + F4 + 7 for 2 seconds to shut the soundboard down.

## Setup
- You first need to have AutoHotkey (only works on Windows) installed for this script to work.
- Download Soundboard.ahk and bass.dll from the repository and put them in the same directory (don't rename bass.dll).
- Configure the script:
  1. Change the variable "device" to your output device's name (visible in the sound mixer). You can use some virtual audio cables if you want to combine the sound with your microphone, but I won't explain how to do this here. I personally use Elgato Wave Link.
  2. Add absolute paths to installed sound files to the other variables (e.g., f1n2 for Ctrl + F1 + 2 as a shortcut) and adjust the volume (0..1); also, optionally add a sound for shutdown of the soundboard (disabledSound).
  3. If you have knowledge of AutoHotkey, you can change the keybinds or add your own features to the soundboard.
