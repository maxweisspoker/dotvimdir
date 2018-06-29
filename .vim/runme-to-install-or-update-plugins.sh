#!/bin/bash
# Do not move this script, it must stay in the current directory!
PWD=$(pwd)
echo 'Re-installing Vundle'
mkdir -p $PWD/bundle/
rm -rf $PWD/bundle/*
git clone https://github.com/VundleVim/Vundle.vim.git $(pwd)/bundle/Vundle.vim > /dev/null 2>&1
echo 'Finished'
echo 'Re-installing Plugins'
vim -c PluginInstall -c quitall -i NONE > /dev/null 2>&1
echo 'Finished'
echo 'Updating Plugins'
vim -c VundleUpdate -c quitall -i NONE > /dev/null 2>&1
echo 'Finished'
echo 'Compiling debugging interface'
cd $PWD/bundle/vimproc.vim
make > /dev/null 2>&1
echo 'Finished'
echo 'Remaking YouCompleteMe objects'
cd $PWD/bundle/YouCompleteMe
git submodule update --init --recursive > /dev/null 2>&1
#python3 ./install.py --clang-completer
##The next line is for Arch, the previous line is for Ubuntu
python3 ./install.py --clang-completer --system-libclang > /dev/null 2>&1
echo 'Finished'
echo ''
echo 'Script completed.'

# Install vim-huge on Ubuntu:
# sudo apt-get purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common gvim
# sudo apt-get install git liblua5.1-dev luajit libxt6 python-dev python3-dev python-pip python3-pip ruby-dev libperl-dev mercurial libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev
#
# cd ~
# git clone https://github.com/vim/vim.git # May want to checkout latest release
# cd vim
# ./configure --with-features=huge \
#             --enable-multibyte \
#             --enable-rubyinterp=yes \
#             --enable-python3interp=yes \
#             --with-python3-config-dir=/usr/lib/python3.6/config \
#             --enable-perlinterp=yes \
#             --enable-luainterp=yes \
#             --enable-gui=gtk2 \
#             --enable-cscope \
#             --prefix=/usr/local
# make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
# sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim80 install

# If setting up a new Vim install from scratch, you'll also need to install
# the python3 version of powerline:
# $ sudo -H pip3 install git+git://github.com/Lokaltog/powerline

# Checkinstall settings for deb for Vim 8.0.1213 (Does not list powerline dependency)
# 0 -  Maintainer: [ root@ubuntu ]
# 1 -  Summary: [ Vim-huge with python3 support ]
# 2 -  Name:    [ vim-huge ]
# 3 -  Version: [ 8.0.1213 ]
# 4 -  Release: [ 1 ]
# 5 -  License: [ GPL ]
# 6 -  Group:   [ checkinstall ]
# 7 -  Architecture: [ amd64 ]
# 10 - Requires: [ liblua5.1-dev,luajit,libxt6,python-dev,python3-dev,ruby-dev,libperl-dev,mercurial,libncurses5-dev,libgnome2-dev,libgnomeui-dev,libgtk2.0-dev,libatk1.0-dev,libbonoboui2-dev,libcairo2-dev,libx11-dev ]
# 11 - Provides: [ vim,vim-runtime,vim-huge,vim-common ]
# 12 - Conflicts: [ vim,vim-runtime,vim-gnome,vim-tiny,vim-common,vim-gui-common ]
# 13 - Replaces: [ vim,vim-runtime,vim-gnome,vim-tiny,vim-common,vim-gui-common,vim-huge ]
