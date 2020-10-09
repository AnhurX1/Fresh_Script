#!/bin/bash

# Color Variables
RED='\e[31m'
GREEN="\e[92m"
BLUE='\e[34m'
PURPLE='\e[35m'
WHITE='\e[37m'
ORANGE='\e[33m'

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
sudo apt install figlet -y > /dev/null 2>&1 # install figlet
echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar

# killing the spinner function
kill $spinner_pid
wait $spinner_pid 2>/dev/null

# Our Banner Is Now Ready
printf '\n'
printf '\n'
figlet -f slant F R E S H
printf '\n'
printf '\n'

printf "${RED}            [+] UPDATING APT\n"
printf '\n'
printf '\n'
bar &
bar_pid=$!
sudo apt update
printf '\n'
printf '\n'


printf "${GREEN}            [+] Installing Wget\n"
printf '\n'
printf '\n'
sudo apt install wget -y 
printf '\n'
printf '\n'


printf "${ORANGE}            [+] Installing Git\n"
printf '\n'
printf '\n'
sudo apt install git -y 
printf '\n'
printf '\n'



printf "${GREEN}            [+] Installing VIM\n"
printf '\n'
printf '\n'
sudo apt install vim -y 
sudo apt install vim-gtk -y
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim | pv -p
sudo git clone https://github.com/AnhurX1/dotfiles
cd dotfiles
cp .vimrc ~/
cd ..
mkdir ~/.vim/swp
mkdir ~/.vim/.backup
printf '\n'
printf '\n'


printf "${WHITE}            [+] INSATLLING Plank Dock\n"
printf '\n'
printf '\n'
sudo apt install plank -y
printf '\n'
printf '\n'


printf "${ORANGE}            [+] ISNTALLING RedShift\n"
printf '\n'
printf '\n'
sudo apt install redshift redshift-gtk -y
printf '\n'
printf '\n'


printf "${PURPLE}            [+] INSTALLING Zsh\n"
printf '\n'
printf '\n'
sudo apt install zsh -y
sudo chsh -s $(which zsh)
printf '\n'
printf '\n'

printf "${PURPLE}            [+] INSTALLING OhMyZsh\n"
printf '\n'
printf '\n'
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
printf '\n'
printf '\n'
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cd dotfiles
sudo cp .zshrc ~/
cd ..


printf "${RED}            [+] UPGRADING APT\n"

sudo apt upgrade

printf '\n\n'
figlet -f slant D O N E !
printf '\n\n'
