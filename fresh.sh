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
spinner_pid=$!

# Building (silently)
sudo apt install figlet -y > /dev/null 2>&1 # install figlet
echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar

# killing the spinner function
kill $spinner_pid
wait $spinner_pid 2>/dev/null

# Our Banner Is No Ready
printf '\n'
printf '\n'
figlet -f slant FRESH
printf '\n'
printf '\n'

echo '                      #### apt Update ####'
printf '\n'
printf '\n'
bar &
bar_pid=$!
sudo apt update
printf '\n'
printf '\n'


echo '                      #### Installing wget ####'
printf '\n'
printf '\n'
sudo apt install wget -y 
printf '\n'
printf '\n'


echo '                      #### Installing Git ####'
printf '\n'
printf '\n'
sudo apt install git -y 
printf '\n'
printf '\n'



echo '                      #### Installing vim+=vundle ####'
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


echo '                      #### Installing plank-Dock ####'
printf '\n'
printf '\n'
sudo apt install plank -y
printf '\n'
printf '\n'


echo '                      #### Installing RedShift ####'
printf '\n'
printf '\n'
sudo apt install redshift redshift-gtk -y
printf '\n'
printf '\n'


echo '                      #### Installing zsh ####'
printf '\n'
printf '\n'
sudo apt install zsh -y
sudo chsh -s $(which zsh)
printf '\n'
printf '\n'

echo '                      #### Installing ohmyzsh ####'
printf '\n'
printf '\n'
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
printf '\n'
printf '\n'
echo '                      ### apt Upgrade..'

sudo apt upgrade

printf '\n\n'
figlet -f slant DONE!
printf '\n\n'
