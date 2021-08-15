#!/bin/bash
#Check to make sure the installer isn't used as root.
if [[ $(id -u) == 0 ]];
  then echo "You are running this installer as root. You probably don't want this. If you are really sure you want to run this as root you can comment out this check (line 3 to 6)."
  exit
fi
#Check to make sure lutris is installed.
if ! lutris -v COMMAND &> /dev/null
then
    echo "Lutris could not be found. You can find installation instructions for lutris here: https://lutris.net/downloads/"
    exit
fi
#Check to make sure wine is installed. If you want to use an alternative version of wine comment out the next four lines of code and change wine to your desired version.
if ! wine --version COMMAND &> /dev/null
then
    echo "Wine could not be found. You can find installation instructions for wine here: https://wiki.winehq.org/Download"
    exit
fi

echo "It is best practice to run this installer in a folder containing only the files required by this installer."
read -p "Would you like to continue? (y/n) " ans
if [[ $ans == "y" ]];
    then
    echo "Make sure the ISO file containing the original game is mounted or the CD is in your CD-drive."
    read -p "Press any key to continue if the CD is ready... " -n1 -s
    echo "This installer requires two different files:"
    echo "Tsukihime_English_v1.1_[mirror_moon].exe from http://mirrormoon.org/projects/complete/tsukihime/"
    echo "Tsukihime_English_v1.2_patch_[mirror_moon].exe from http://mirrormoon.org/projects/complete/tsukihime/"
    echo "Both of these files should be present in the same directory as the installer."
    $FILE="Tsukihime_English_v1.1_[mirror_moon].exe"
    if test -f $FILE;
        then
        echo "Tsukihime_English_v1.1_[mirror_moon].exe was found!"
    else
        echo "Tsukihime_English_v1.1_[mirror_moon].exe not found. Bailing out! Did you download the file? If you did download the file did you change the name?"
        exit
    fi
    echo "The first patch will be applied. Make sure to remember the path where you decide to install the patch."
    read -p "Press any key to apply the first patch..." -n1 -s
    wine Tsukihime_English_v1.1_[mirror_moon].exe
 $FILE="Tsukihime_English_v1.2_update_[mirror_moon].exe"
    if test -f $FILE;
        then
        echo "Tsukihime_English_v1.2_update_[mirror_moon].exe was found!"
    else
        echo "Tsukihime_English_v1.2_update_[mirror_moon].exe not found. Bailing out! Did you download the file? If you did download the file did you change the name?"
        exit
    fi
    echo "The second patch will be applied. Make sure to install the second patch in the same path."
    read -p "Press any key to apply the second patch..." -n1 -s
    wine Tsukihime_English_v1.2_update_[mirror_moon].exe
    echo "All patches have been applied. Lutris will finish the installation."
    echo "When the installer starts press install and be sure to give the correct path."
    echo "If you path in windows started with C:\ you will need to point it to your wine directory which is probably /home/username/.wine/drive_c/The rest of your path/"
    read -p "Press any key to start the lutris installer..." -n1 -s
    lutris lutris:tsukihime-english-mirrormoon
    echo "Everything should be done now. You can play Tsukihime from lutris now."
else
    echo "Move the installer to a safe folder and run it again."
fi
