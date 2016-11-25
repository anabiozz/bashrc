#!/bin/bash
# work script
# adduser $USER sudo

echo "configuring sources.list"
SOURCES_LIST="/etc/apt/sources.list"
sudo /bin/cat << EOM > $SOURCES_LIST
# See sources.list(5) for more information, especialy
# Remember that you can only use http, ftp or file URIs
# CDROMs are managed through the apt-cdrom tool.

deb http://ftp.ru.debian.org/debian jessie main contrib non-free
deb-src http://ftp.ru.debian.org/debian jessie main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
# MintMenu
deb http://packages.linuxmint.com/ debian main upstream import
# openjdk 8
deb http://ftp.de.debian.org/debian jessie-backports main

#deb http://cdn.debian.net/debian jessie main contrib non-free
#deb http://cdn.debian.net/debian jessie-updates main contrib non-free
#deb http://security.debian.org/ jessie/updates main contrib non-free
#deb http://http.debian.net/debian jessie-backports main
# Uncomment if you want the apt-get source function to work
#deb-src http://http.us.debian.org/debian stable main contrib non-free
#deb-src http://non-us.debian.org/debian-non-US stable/non-US main contrib non-free
EOM

echo "system update"
sudo apt-get install deb-multimedia-keyring linuxmint-keyring
sudo apt-get update
sudo apt-get upgrade

# for nginx installing
sudo systemctl stop apache2.service

sudo apt-get install mate-system-tools caja-extensions-common \
caja-gksu caja-open-terminal dconf-editor dconf-tools mate-gnome-main-menu-applet mate-netbook \
mate-netspeed mc unrar preload ntp transmission gdebi gparted bleachbit geary \
musique vlc apt-xapian-index qt4-qtconfig mintmenu \
firmware-linux-nonfree unzip build-essential cmake mysql-client mysql-server redis-server nginx \
openjdk-8-jdk openjdk-7-jdk gdb pkg-config git git-core gnupg flex bison gperf \
zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
libgl1-mesa-dev libxml2-utils xsltproc ethtool libssl-dev \
abootimg virtualbox

#For qemu
sudo apt-get install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev
sudo apt-get install libnfs-dev libiscsi-dev

#For build and configuring kernel
sudo aptitude install kernel-package

#For qemu
sudo apt-get install libsdl1.2debian zlib1g libx11-dev libsdl1.2-dev texi2html \
 sharutils libgpmg1-dev vgabios bochsbios proll

#VirtualBox
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install dkms
sudo apt-get install virtualbox-5.1
sudo usermod -a -G vboxusers `whoami`

sudo apt-get purge gnome-orca

sudo apt-get autoremove
sudo apt-get clean
sudo apt-get autoclean

#create some necessary directions
mkdir $HOME/packages

echo "installing android studio IDE"

ANDROID_IDE="https://dl.google.com/dl/android/studio/ide-zips/2.2.0.12/android-studio-ide-145.3276617-linux.zip"
sudo wget -a  --progress=bar $ANDROID_IDE -P $HOME/packages
unzip $HOME/packages/android-studio-ide-145.3276617-linux.zip -d $HOME

echo "installing android SDK"
ANDROID_SDK="https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz"
sudo wget -a  --progress=bar $ANDROID_SDK -P $HOME/packages
sudo tar zxvf $HOME/packages/android-sdk_r24.4.1-linux.tgz -C $HOME

echo "copying files from the flash"
sudo cp -r go books android_rom $HOME/
sudo cp -r sublime_text/sublime_text $HOME/
sudo cp -r sublime_text/.config/ $HOME/.config/
sudo cat .bashrc > $HOME/.bashrc

echo "creating projects directory"
mkdir $HOME/projects/{c, java, android, web/{angular, go, dart}}

echo "clone masteringwebservices to go directory"
git clone https://github.com/nkozyra/masteringwebservices $HOME/projects/web/go

echo "installing dart SDK"
DART_SDK="https://storage.googleapis.com/dart-archive/channels/dev/release/1.20.0-dev.7.0/sdk/dartsdk-linux-x64-release.zip"
sudo wget -a  --progress=bar $DART_SDK -P $HOME/packages
unzip $HOME/packages/dartsdk-linux-x64-release.zip -d $HOME

echo "installing dartium"
DARTIUM="https://storage.googleapis.com/dart-archive/channels/dev/release/1.20.0-dev.7.0/dartium/dartium-linux-x64-release.zip"
sudo wget -a  --progress=bar $DARTIUM -P $HOME/packages
unzip $HOME/packages/dartium-linux-x64-release.zip -d $HOME

#COUCHBASE="http://www.couchbase.com/nosql-databases/downloads#download_form"
#dpkg -i couchbase-server version.deb



