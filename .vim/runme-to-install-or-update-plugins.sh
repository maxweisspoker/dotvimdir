#!/bin/bash
# Do not move this script, it must stay in the current directory!
echo 'Re-installing Vundle'
rm -rf $(pwd)/bundle/
mkdir $(pwd)/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git $(pwd)/bundle/Vundle.vim > /dev/null 2>&1
echo 'Finished'
echo 'Re-installing Plugins'
vim -i NONE -c PluginInstall -c quitall > /dev/null 2>&1
echo 'Finished'
echo 'Updating Plugins'
vim -i NONE -c VundleUpdate -c quitall > /dev/null 2>&1
echo 'Finished'
echo 'Remaking YouCompleteMe objects'
cd $(pwd)/bundle/YouCompleteMe
git submodule update --init --recursive > /dev/null 2>&1
./install.py --clang-completer > /dev/null 2>&1
echo 'Finished'
echo ''
echo 'Script completed.'

