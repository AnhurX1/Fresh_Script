#!/bin/bash

spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

printf 'Please Fasten Your Seatbelt... You Have Been Warned! '
spinner &
# Building the banner (silent)
sudo apt-get update -y > /dev/null 2>&1 # Update
sudo apt-get install figlet -y > /dev/null 2>&1 # install figlet
sudo apt-get install ruby -y > /dev/null 2>&1 # install ruby
sudo apt-get install wget -y > /dev/null 2>&1 # install wget

# install lolcat
sudo wget https://github.com/busyloop/lolcat/archive/master.zip > /dev/null 2>&1
sudo unzip master.zip > /dev/null 2>&1
cd lolcat-master/bin > /dev/null 2>&1
sudo gem install lolcat > /dev/null 2>&1
cd ..
sudo rm master.zip

# download 3d font
sudo wget https://github.com/xero/figlet-fonts/archive/master.zip > /dev/null 2>&1
sudo unzip master.zip > /dev/null 2>&1
cd figlet-fonts-master
cp 3d.flf ~/Documents 
cd ..
sudo rm master.zip

# killing the spinner function
kill > /dev/null 2>&1 "$!"  # kill the spinner
printf '\n'
printf '\n'

# Our Banner Is No Ready
figlet -f ~/Documents/3d.flf FRESH | lolcat
printf '\n\n'



echo '                      ###Installing Git..'
printf '\n'
printf '\n'
sudo apt-get install git -y
printf '\n'
printf '\n'

echo '                      ###Installing vim+=vundle..'
printf '\n'
printf '\n'
sudo apt-get install vim -y
sudo apt-get install vim-gtk -y
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo wget https://github.com/AnhurX1/dotfiles/archive/master.zip
sudo unzip master.zip
cd dotfiles-master
cp .vimrc ~/
cd ..
sudo rm master.zip
printf '\n'
printf '\n'


echo '                      ###Installing plank-dock..'
printf '\n'
printf '\n'
sudo apt-get install plank -y
printf '\n'
printf '\n'


echo '                      ###Installing redshift..'
printf '\n'
printf '\n'
sudo apt-get install redshift redshift-gtk -y
printf '\n'
printf '\n'


echo '                      ###Installing zsh..'
printf '\n'
printf '\n'
sudo apt-get install zsh -y
sudo chsh -s $(which zsh)
printf '\n'
printf '\n'

echo '                      ### Installing ohmyzsh..'
printf '\n'
printf '\n'
sudo sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
printf '\n'
printf '\n'
echo '                      ### apt Upgrade..'

sudo apt-get upgrade

printf '\n\n'
figlet -f ~/Documents/3d.flf DONE | lolcat
printf '\n\n'
