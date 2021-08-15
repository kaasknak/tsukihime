### Installer for Tsukihime on linux systems using WINE.
This repository hosts as bash installer for Tsukihime using WINE and adding it to lutris.
In order to install the game you will need an original CD or the .iso file of an original CD (NOT a .img-file, for some reason this game won't mount if it is on a .img file. This problem persists using different programs / converters and seems to persist on windows systems as well with the exception of using Daemon Tools.).
These can be hard to obtain as tsukihime is abandonware.
It is probably easiest to look online for a second hand version.

### Why a bash script? Why not write the whole thing in a lutris script?
The visual novel works fine under WINE unpatched but video doesn't work after patching. We still need WINE to patch the game though otherwise you would have to play in Japanese (not that there is anything wrong with that but considering that you are reading this you probably prefer playing in English).
The game will run using something called onscripter which runs without WINE. Lutris does not play nice with installing a game with one runner and then playing it with another. This is why the script arranges the proper patching and then allows [an already existing lutris script][lutris-script] to download onscripter.

### Why is there no music?
The first patch removes the audio. It also contains instructions on how to fix this.
Instructions can be found in Chapter 7 of the Readme.txt available in your installation folder.
I might expand on the installer later to automate this or someone with more time and willpower could do it and send a pull-request.

### Lutris failed to download onscripter!
Oh dear. This means archive.org is down. Luckily onscripter is GPL licensed. You should find it among the releases in this repo. Download it and tell lutris to manually pick the file.

### There are so many other Nasuverse visual novels. Where are they?
Fate/stay night can be found [here][fsnrnue] due to the amazing work of @leycec.
Also responsible for inspiring me to create this repo.
If I find / make other installers I shall expand on it here.

### Well actually. You could have done all of this from lutris using the lutris installer. You just had to ...
If you fork it and send me a pull request I will check it out.

### Why do I need to manually download so many files?
Because these files are not easily accessible from the command line.

### Has it been tested?
| Operating system | Starts? | Extensively played? |
| --- | --- | --- |
| Ubuntu 20.04.2 | Yes | Not yet |

[lutris-script]: https://lutris.net/games/tsukihime/
[fsnrnue]: https://github.com/leycec/fsnrnue
