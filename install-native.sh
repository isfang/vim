#!/bin/zsh

vimrc_path="/Users/${USER}/.vimrc"

if [ ! -f $vimrc_path ];then
echo "file ${vimrc_path} is not exist."
else
echo "file ${vimrc_path} is exist."
rm -f $vimrc_path
echo "file ${vimrc_path} is deleted."
fi
    
cp vimrc $vimrc_path

vim_plug_path="/Users/${USER}/.vim/autoload/plug.vim"
if [ ! -f $vim_plug_path ];then
echo "file ${vim_plug_path} is not exist."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
echo "file ${vim_plug_path} is exist."
fi
