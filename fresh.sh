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
apt-get install pv -y > /dev/null 2>&1
sudo apt-get install figlet -y > /dev/null 2>&1 # install figlet

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
sudo apt-get update | pv -p   # Update
printf '\n'
printf '\n'


echo '                      #### Installing wget ####'
printf '\n'
printf '\n'
sudo apt-get install wget -y | pv -p
printf '\n'
printf '\n'


echo '                      #### Installing Git ####'
printf '\n'
printf '\n'
sudo apt-get install git -y | pv -p
printf '\n'
printf '\n'



echo '                      #### Installing vim+=vundle ####'
printf '\n'
printf '\n'
sudo apt-get install vim -y | pv -p
sudo apt-get install vim-gtk -y | pv -p
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim | pv -p
sudo git clone https://github.com/AnhurX1/dotfiles | pv -p
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
sudo apt-get install plank -y | pv -p
printf '\n'
printf '\n'


echo '                      #### Installing RedShift ####'
printf '\n'
printf '\n'
sudo apt-get install redshift redshift-gtk -y | pv -p
printf '\n'
printf '\n'


echo '                      #### Installing zsh ####'
printf '\n'
printf '\n'
sudo apt-get install zsh -y | pv -p
sudo chsh -s $(which zsh)
printf '\n'
printf '\n'

echo '                      #### Installing ohmyzsh ####'
printf '\n'
printf '\n'
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" | pv -p
printf '\n'
printf '\n'
echo '                      ### apt Upgrade..'

sudo pv -p apt-get upgrade

printf '\n\n'
figlet -f slant DONE!
printf '\n\n'
