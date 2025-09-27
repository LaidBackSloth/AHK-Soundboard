# AHK-Soundboard
Turn your keyboard into a customizable soundboard by using Auto Hotkey

## General
When I was searching for a soundboard application, I couldn't find any that fit all my needs. I wanted to setup keybinds that trigger sounds (which both I can hear and also my friends in the voice chat), but without interfering with the regular use of my keyboard. This meant that I didn't want to have the keys I pressed registered outside the soundboard when playing a sound while also not delaying regular key presses not meant for playing sounds.

I didn't intend to publish my script, but since I'm happy using it for a few years now, I finally uploaded it to GitHub. But keep in mind that this is not a simple executable that you run and you're done.

## Setup
* You first need to have [AutoHotkey](https://www.autohotkey.com/) (only works on Windows) installed for this script to work
* Download Soundboard.ahk and bass.dll from the repository and put them in the same directory (don't rename bass.dll)
* Configure the script:
  1. Change the Variable "device" to your output device's name (visible in the sound mixer). You can use some virtual audio cables if you want to combine the sound with your microphone, but I won't explain how to do this here. I personally use Elgato Wave Link.
  2. Add absolute paths to installed sound files to the other variables (e.g. f1n2 for Ctrl + F1 + 2 as shortcut)

The description is not yet finished!
