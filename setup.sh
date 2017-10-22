#!/bin/bash

function link_file()
{
    if [ -e "$1" ]; then
    mkdir -p ~/dotfiles_backup
        cp "$1" ~/dotfiles_backup/
        rm "$1"
    fi
    ln -sf "${MY_PATH}/$1" .
}

MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
#echo "MY_PATH=${MY_PATH}"

pushd ~ >/dev/null
link_file ".tmux.conf"
link_file ".gitconfig"
link_file ".vimrc"
if [ -L ~/.vim ]; then
    rm ~/.vim
fi
ln -sf "${MY_PATH}" .vim
popd >/dev/null
exit 0
