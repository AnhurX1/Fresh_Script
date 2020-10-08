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
# Building (silently)
apt-get install pv -y > /dev/null 2>&1
sudo apt-get install figlet -y > /dev/null 2>&1 # install figlet
# Our Banner Is No Ready
figlet -f slant FRESH
printf '\n\n'

# killing the spinner function
kill $spinner_pid # kill the spinner
wait $spinner_pid > /dev/null 2>&1
printf '\n'
printf '\n'

echo '                      #### apt Update ####'
printf '\n'
printf '\n'
sudo pv -p apt-get update  # Update
printf '\n'
printf '\n'


echo '                      #### Installing wget ####'
printf '\n'
printf '\n'
sudo pv -p apt-get install wget -y
printf '\n'
printf '\n'


echo '                      #### Installing Git ####'
printf '\n'
printf '\n'
sudo pv -p apt-get install git -y
printf '\n'
printf '\n'



echo '                      #### Installing vim+=vundle ####'
printf '\n'
printf '\n'
sudo pv -p apt-get install vim -y
sudo pv -p apt-get install vim-gtk -y
sudo pv -p git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo pv -p git clone https://github.com/AnhurX1/dotfiles
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
sudo pv -p apt-get install plank -y
printf '\n'
printf '\n'


echo '                      #### Installing RedShift ####'
printf '\n'
printf '\n'
sudo pv -p apt-get install redshift redshift-gtk -y
printf '\n'
printf '\n'


echo '                      #### Installing zsh ####'
printf '\n'
printf '\n'
sudo pv -p apt-get install zsh -y
sudo chsh -s $(which zsh)
printf '\n'
printf '\n'

echo '                      #### Installing ohmyzsh ####'
printf '\n'
printf '\n'
sudo pv -p sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
printf '\n'
printf '\n'
echo '                      ### apt Upgrade..'

sudo pv -p apt-get upgrade

printf '\n\n'
figlet -f slant DONE!
printf '\n\n'
