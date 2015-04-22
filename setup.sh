#!/bin/sh

cd `dirname $0`
CURDIR=`pwd`
echo $CURDIR

NOWDATE=`date +%Y-%m-%d-%H-%M`

if [ -d ~/.vim ]; then
    mkdir -p tmp/$NOWDATE
    mv ~/.vim tmp/$NOWDATE
    echo "original .vim mv to $CURDIR/tmp/$NOWDATE"
fi

if [ -f ~/.vimrc ]; then
    mkdir -p tmp/$NOWDATE
    mv ~/.vimrc tmp/$NOWDATE
    echo "original .vimrc mv to $CURDIR/tmp/$NOWDATE"
fi

if [ -f ~/.gvimrc ]; then
    mkdir -p tmp/$NOWDATE
    mv ~/.gvimrc tmp/$NOWDATE
    echo "original .gvimrc mv to $CURDIR/tmp/$NOWDATE"
fi

if [ -f ~/.zshrc ]; then
    mkdir -p tmp/$NOWDATE
    mv ~/.zshrc tmp/$NOWDATE
    echo "original .zshrc mv to $CURDIR/tmp/$NOWDATE"
fi

if [ -f ~/.tmux.conf ]; then
    mkdir -p tmp/$NOWDATE
    mv ~/.tmux.conf tmp/$NOWDATE
    echo "original .tmux.conf mv to $CURDIR/tmp/$NOWDATE"
fi

echo "ln -s $CURDIR/.vim ~/"
echo "ln -s $CURDIR/.vimrc ~/"
echo "ln -s $CURDIR/.zshrc ~/"
echo "ln -s $CURDIR/.tmux.conf ~/"

ln -s $CURDIR/.vim ~/
ln -s $CURDIR/.vimrc ~/
ln -s $CURDIR/.zshrc ~/
ln -s $CURDIR/.tmux.conf ~/
