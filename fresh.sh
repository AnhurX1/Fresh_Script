#!/bin/bash

# Color Variables
RED='\e[31m'
GREEN="\e[92m"
BLUE='\e[34m'
PURPLE='\e[35m'
WHITE='\e[37m'
ORANGE='\e[33m'
STOP="\e[0m" 

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
spinner_pid=$!

# Building (silently)
sudo apt-get install figlet -y > /dev/null 2>&1 # install figlet

# killing the spinner function
kill $spinner_pid
wait $spinner_pid 2>/dev/null

# Our Banner Is Now Ready
printf '\n'
printf '\n'
figlet -f slant F R E S H
printf '\n'
printf '\n'

printf "${RED} [+] UPDATING APT\n"
printf "${STOP}"
spinner &
spinner_pid=$!
sudo apt-get update > /dev/null

printf "[+] Installing Wget\n"
printf "${STOP}"
sudo apt-get install wget -y > /dev/null


printf "${ORANGE} [+] Installing Git\n"
printf "${STOP}"
sudo apt-get install git -y > /dev/null


printf "${GREEN} [+] Installing VIM\n"
printf "${STOP}"
sudo apt-get install vim -y > /dev/null
sudo apt-get install vim-gtk -y > /dev/null
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null
sudo git clone https://github.com/AnhurX1/dotfiles > /dev/null
cd dotfiles
cp .vimrc ~/
cd ..
mkdir ~/.vim/swp
mkdir ~/.vim/.backup

printf "${BLUE} [+] INSATLLING Plank Dock\n"
printf "${STOP}"
sudo apt-get install plank -y > /dev/null


printf "${ORANGE} [+] ISNTALLING RedShift\n"
printf "${STOP}"
sudo apt-get install redshift redshift-gtk -y > /dev/null

printf "${PURPLE} [+] INSTALLING Zsh\n"
printf "${STOP}"
sudo apt-get install zsh -y > /dev/null
sudo chsh -s $(which zsh) 
printf "${PURPLE} [+] INSTALLING OhMyZsh\n"
printf "${STOP}"
sudo wget -q https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /dev/null
sh install.sh > /dev/null
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
cd dotfiles
sudo cp .zshrc ~/
cd ..


printf "${RED} [+] UPGRADING APT\n"
printf "${STOP}"

sudo apt-get upgrade > /dev/null

kill $spinner_pid
wait $spinner_pid 2>/dev/null

printf '\n\n'
figlet -f slant D O N E !
printf '\n\n'
